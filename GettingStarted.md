# Getting started with Artemis

> This guide assumes you've already installed Artemis as a dependency to your project and setup schema generation. If you haven't yet, be
sure to check out the [installation and setup guide](https://github.com/Saelyria/Artemis/tree/master/InstallationSetup.md) first.

> It also assumes that you're reasonably familiar with the basics of GraphQL. If you're not, we recommend you take a quick look at their
beginner documentation [here](https://graphql.org/learn/).

## Core types in Artemis

At a high level, requests are made with Artemis by creating a `Client` object, then giving it `Operation` objects to perform. Operations are 
created using function builders, where we give them all the fields on schema types we want included in the response. These schema types
are generated from GraphQL schema files, and represent the objects, enums, interfaces, etc. that make up the GraphQL API. In the 
response handler on a client object, we get `Partial` objects that wrap a type in our GraphQL schema - kind of like a type-safe dictionary
replacement with all the same keypaths as the generated schema types. All interaction with your GraphQL API is done with Swift types with
all the type safety that gives us - you're never dealing with text files of GraphQL requests or raw `Data` or `Dictionary` responses that you
need to parse.

### Fields

First things first, we'll look at `Field`s. In this guide, we'll be using a countries GraphQL API found [here](https://countries.trevorblades.com),
building on it where appropriate to demo different features. Running this API's schema through Artemis' codegen tool gives us a bunch of 
model schema files that look something like this:

```swift
import Artemis

final class Continent: Object, ObjectSchema {

  var code = Field<String, NoArguments>("code")

  var name = Field<String, NoArguments>("name")

  var countries = Field<[Country]?, NoArguments>("countries")
}
```
A lot of this `Continent` type can be inferred from reading it, but there's a handful of things that might look a little peculiar so that we can
map the GraphQL query language into Swift while taking full advantage of Swift's type safety.

The most important bits are the `Field` properties on our `Continent` - `code`, `name`, and `countries`. `Field` properties first declare
the returned type of the field, then a struct that contains all the arguments to the field. We'll get to arguments later - for now, none of these
fields have arguments, so this is set to `NoArguments`.

Now let's assume we have a simple query root object like this:

```swift
final class Query: Object, ObjectSchema {

  var continents = Field<[Continent]?, NoArguments>("continents")
}
```

### Making requests with clients

With that, we can create a new `Client` object and make a request with all the keypath information on these two types. We'll do a simple
one that just gets all the continents, getting the name of each continent. First we'll make a new client object by initializing it with the URL
to our API:

```swift
let client = Client<Query>(endpoint: URL(string: "https://countries.trevorblades.com/")!)
```

Then we'll call the `perform` method on the client object, building a new `Operation` object. Operation objects are initialized with the
type of operation (either 'query' or 'mutation'), then a function builder of `Add` instances where we add the fields we want to select. `Add`
objects are created at the top-level with keypaths from the `Query` object we specialized our client with. So, we'll start out by 'selecting'
the one field on our root query object - the 'continents' field. We can do that like this:

```swift
client.perform(Operation(.query) {
  Add(\.continents)
}, completion: { result in

})
```

Try and run that, though, and it won't compile. Following GraphQL's rules, if the value of the selected field (i.e., the value of the keypath) is 
an 'object' or an array of 'objects', we need to keep giving selections until we get to 'scalar' values (i.e. raw values like integers or strings).
In other words, we need to keep specifying on our selected 'continents' field which properties of `Continent` we want. So, we'll add that
we want the continent's name, like so:

```swift
client.perform(Operation(.query) {
  Add(\.continents) {
    Add(\.name)
  }
}, completion: { result in

})
```
This will compile, since `name` is a `String` (a scalar value). You'll also notice that `name` is referring to the keypath on our generated
`Continent` type - Artemis builds all its requests using these type-safe keypaths, so it always knows what types we're dealing with, and
can have compile-time checking for rules like that object-scalar selection rule.

This compile-time checking also comes in handy with the `result` in the completion handler. This is a native Swift `Result` enum whose
'success' type is determined by the selection in the operation - in this case, an array of `Partial<Continent>`s. These 'partial' objects
can be treated like a stand-in `Continent` object - we'll play around with one to demonstrate. Update your request's completion handler
like this:

```swift
... completion: { result in
  switch result {
  case .success(let continents):
    continents.forEach { continent in
	  print(continent.name)
	}
  case .failure(let error):
    print(error)
  }
}
```

Which, if hooked up to a live API with real data, would make the request and populate these 'partial' continent objects with a 'name' string.
The thing that makes it 'partial' is that, naturally, if we were to ask our `continent` in the for-each loop for its `code`, like this:

```swift
continents.forEach { continent in
  print(continent.code)
}
```

It would return nil, since it wasn't added to the request's selection. If we changed our minds and did want to add it, we can just add it to
the request like this, just like you'd expect:

```swift
Operation(.query) {
  Add(\.continents) {
    Add(\.name)
    Add(\.code)
  }
}
```

### Arguments

An important feature with GraphQL is the ability for fields to take arguments. In Artemis, 'argument lists' for a field are generated as a class
conforming to the `ArgumentsList` protocol, where its properties (of type `Argument`) are the arguments to a field. They are attached to
a field via the generic arguments to it. Here's an example of what that all might look like with a new `continent` field on our root query:

```swift
var continent = Field<Continent?, ContinentArguments>("continent")
final class ContinentArguments: ArgumentsList {
  var code = Argument<String>("code")
}
```

The code is a little verbose, but don't worry about all the types in it - all these relationships are automatically generated from the schema 
file.

Once we have arguments declared on a field, we can add them to a selection of that field on a request in basically the same way we add
arguments to a SwiftUI view - as a trailing function call, like this:

```swift
client.perform(Operation(.query) {
  Add(\.continent) {
    Add(\.name)
  }
  .code("NA")
}, completion: { _ in })
```

Where the value passed into the function call is the value for the argument.

### Input objects

Sometimes, arguments for our selections require more complicated 'input object' types. Artemis gives you a syntax very close to GraphQL's
own for selecting fields on input objects. As an example, say our `continents` field had an input object that let us optionally add arguments
to filter the returned continents with filters like the languages spoken, a minimum population, and a maximum population. This would get
generated into a Swift class like this:

```swift
final class ContinentFilterInput: Input, ObjectSchema {
  var languages = Field<[String], NoArguments>("languages")
  var minimumPopulation = Field<Int, NoArguments>("minimumPopulation")
  var maximumPopulation = Field<Int, NoArguments>("maximumPopulation")
}
```

and the `continents` field and its arguments type would be generated like this:

```swift
var continents = Field<[Continent], ContinentsArguments>("continent")
final class ContinentsArguments: ArgumentsList {
  var filters = Argument<ContinentFilterInput>("filters")
}
```

We can then create a request for continents with filters attached like this:

```swift
client.perform(Operation(.query) {
  Add(\.continents) {
    Add(\.name)
  }
  .filters { 
    $0.languages(["Japanese", "Hindi"])
    $0.minimumPopulation(50000000) 
  }
}, completion: { _ in })
```

Here, we've added the `filters` argument to the `continents` field. Since this `filters` argument takes an input object, we give the
`filters` call a closure that gets passed in an object that we call with the input object's fields and their arguments.
