# Getting started with Artemis

> This guide assumes you've already added Artemis as a dependency to your project with Swift Package Manager. If you need help, please
refer to the documentation [here](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

> It also assumes that you're reasonably familiar with GraphQL. If you're not, we recommend you take a quick look at their beginner 
documentation [here](https://graphql.org/learn/).

## Defining your schema

The first step to using Artemis is to define your schema in Swift types that Artmis can use. This can be done fairly easily by referring to your
GraphQL API's schema. In this tutorial, we're going to make the following 'countries of the world' GraphQL API in Artemis:

```
schema {
  query: Query
}

type Query {
  countryCount: Int!
  countries: [Country!]!
  continents: [Continent!]!
  country(code: String!): Country
}

type Country {
  code: String!
  name: String!
  languages: [String!]!
  continent: Continent!
}

type Continent {
  code: String!
  name: String!
  countries: [Country!]!
}
```

To start, we'll make the 'schema' and 'query' types in Swift. These will be two classes, where the 'schema' conforms to the `Schema` 
protocol, and the 'query' conforms to the `Object` protocol - something like this:

```swift
final class MySchema: Schema {
    
}

final class Query: Object {
    
}
```
The `Object` protocol declares that the conforming Swift type represents a GraphQL 'object' (i.e. an entity declared with `type` in the 
GraphQL schema). Its requirements are all there automatically for now, but we'll get to some more of them later. 

The `Schema` protocol declares that the conforming Swift type represents a GraphQL 'schema' (i.e. an entity declared with `schema` in the
GraphQL schema). Its only requirement is a static `query` property, which the compiler should be warning about. We can fix this by adding 
a static `query` property to our `MySchema` object that refers to our `Query` class, like this:

```swift
final class MySchema: Schema {
  static let query = Query()
}
```

Next, we'll declare our main object types - `Country` and `Continent`. We'll do this just like we did with our `Query` type - a 
`final class` that conforms to `Object`:

```swift
final class Country: Object {

}

final class Continent: Object {

}
```

With all our main types declares, all that's left is to start filling in our fields. This is done using the `@Field` property wrapper on variables
inside our `Object` types. Here's what our `Country` type looks like with the `code`,  `name`, `languages`, and `continent` fields from our 
schema:

```swift
final class Country: Object {
  @Field(key: "code") 
  var code: String

  @Field(key: "name") 
  var name: String
    
  @Field(key: "languages") 
  var languages: [String]
    
  @Field(key: "continent") 
  var continent: Continent
}
```
As you can see, each field from the original GraphQL schema is represented as a variable with the same name and type (remember that `!`
in a GraphQL schema means non-optional!). These variables are then wrapped with `@Field`, where the `Field` is instantiated with the
string name of the field in the original GraphQL schema. While the variable name can technically be different from the schema, the `key` 
string value _must_ match the original GraphQL schema.

We can now do the same with our `Continent` type:

```swift
final class Continent: Object {
  @Field(key: "code") 
  var code: String

  @Field(key: "name") 
  var name: String

  @Field(key: "countries") 
  var countries: [Country]
}
```

Now that our two main types are defined, we can go back to our top-level `Query` type. One of its fields (`country`) uses arguments, so the 
field is declared slightly differently on the Swift type. Arguments must be represented by a type (preferably a struct) that conforms to the 
`ArgumentsList` protocol. The properties of this 'arguments list' type should each represent one of the arguments available to the field it's 
associated with. 

We'll describe the arguments for the `country` field as a new struct nested inside `Query`, something like this:

```swift
final class Query: Object {
  struct CountryArgs: ArgumentsList {
    var code: String
  }
}
```
> `ArgumentsList` only requires that the conforming type be `Encodable` (so the type's properties can be turned into the string arguments 
on the sent GraphQL document), so its requirements are automatic on this struct.

Now we can declare our `country` field using the same `@Field` property wrapper. However, instead of declaring the type of this variable
as simply `Country` (i.e. the return type of the field), we need to declare it as a tuple along with a reference to our 'arguments list' type.
This would look like this, along with the other fields on `Query`:

```swift
final class Query: Object {
  @Field(key: "countryCount")
  var countryCount: Int

  @Field(key: "countries")
  var countries: [Country]
    
  @Field(key: "continents")
  var continents: [Continent]

  @Field(key: "country")
  var country: (Country, CountryArgs.Type)

  struct CountryArgs: ArgumentsList {
    var code: String
  }
}
```

Now we're ready to start using this schema to make some requests!

## Making requests

Requests with Artemis are made with instances of `Client`. Most simply, this object is created with a reference to your `Schema` type then
given a `URL` to your GraphQL API's endpoint - something like this:

```swift
let client = Client<MySchema>(endpoint: URL(string: "https://myapi.com")!)
```

`Client` has a `perform` method that we then call with our field selection and a completion handler for the result. Selection starts by
calling either the `.query` or `.mutation` methods (though, our API only supports queries for now, so we'll stick to just `.query`). This 
method is then passed in a closure that include our field selection. Without getting into the weeds of it, fields are 'selected' using a special
[result builder](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID630) closure. This closure is passed in a 
special 'selector' object that can be used with all the same properties as our `Query` type.

This is all best learned with an example. Say we want to make a request that gets all countries (via the `countries` field). Ignoring the 
completion handler for now, this is done by calling the `Client.perform` method like this:

```swift
client.perform(.query {
  $0.countries
}, completion: { _ in

})
```

Try and run that, and... it won't compile. This is because this is an invalid GraphQL query - we need to keep selecting properties until we
reach only 'scalar' types (i.e. basic types like integers or strings), which is enforced by Artemis' type-checking. So, we'll update our
`perform` call to include each country's `name`, like this:

```swift
client.perform(.query {
  $0.countries {
    $0.name
  }
}, completion: { _ in

})
```

### Handling responses

This will compile, since `name` is a `String` (a scalar value). Another noteworthy thing here is that this will also not compile if we tried to
switch `countries` and `name` - Artemis checks the types of nested properties, so it knows that `name` is a property of `Country` (and
that `Country` is the underlying type for the `countries` variable). In a nutshell, this means we're getting Swift compile-time checking on
our GraphQL queries.

This compile-time checking extends past just our requests, though - let's take a look at our completion handler. The value passed into this
handler is a native Swift `Result` enum whose 'success' type is determined by the selection in the operation.

Update your request's completion handler like this:

```swift
... completion: { result in
  switch result {
  case .success(let countries):
    for country in countries {
	  print(country.name)
	}
  case .failure(let error):
    print(error)
  }
}
```

Play around with the `countries` property passed into the `completion`. For example, you'll notice that, if you type `country.` inside the 
loop, you should get an autocomplete list for all the properties on `Country`. Let's run an experiment - update the selection on your
`query` to this while keeping the same code in the `completion`, like this:

```swift
client.perform(.query {
  $0.countryCount
}, completion: { result in
  switch result {
  case .success(let countries):
    for country in countries {
      print(country.name)
    }
  case .failure(let error):
    print(error)
  }
})
```

...and you'll get a compiler error. Since our selection changed, the type of result we get in our `completion` handler also changed - so,
instead of `.success(let countries)` referring to an array of `Country` instances, it is now an integer (since `countryCount` returns an
`Int`). Update your code to this, and it should all compile as expected:

```swift
client.perform(.query {
  $0.countryCount
}, completion: { result in
  switch result {
  case .success(let countryCount):
    print("There are \(countryCount) countries!")
  case .failure(let error):
    print(error)
  }
})
```

### Passing arguments

Passing arguments to fields is also very simple. We have one field in our API that can have arguments passed to it - our `country` field. 
Let's update our request code to look like this:

```swift
client.perform(.query {
  $0.country {
    $0.name
  }
}, completion: { _ in
  
})
```
...and it won't compile. This is because, for fields that have arguments, they _must_ be passed (since this would result in an invalid query as
well). To pass arguments, we just need to call that `country` selection with an `arguments` parameter with an instance of the field's
associated `ArgumentsList` type (in this case, an instance of `CountryArgs`). That all looks like this:

```swift
client.perform(.query {
  $0.country(arguments: .init(code: "CA")) {
    $0.name
  }
}, completion: { _ in
  
})
```

## Mutations

Now, let's say our API wanted to add the ability to create new countries (creating new nations is as easy as an API call, after all). Events
that create or update must be declared as a 'mutation' field. In Artemis, this is done in basically the same way as creating a query object - 
simply create a new class conforming to `Object`, then declare it on the schema. That all looks like this, updating our existing `MySchema`:

```swift
final class MySchema: Schema {
    static let query = Query()
    static let mutation = Mutation()
}

final class Mutation: Object {
    
}
```

Let's assume that our GraphQL schema for the mutation looks like this, where all the required fields of a country are provided:

```
type Mutation {
  createCountry(code: String!, name: String!, languages: [String!]!, continentCode: String!): Country!
}

```

Then we'll just make up a quick `createCountry` field on our `Mutation`, along with an `ArgumentsList` type that contains all the 
arguments listed on the field:

```swift
final class Mutation: Object {
  @Field("createCountry")
  var createCountry: (Country, CreateCountryArgs.Type)
  
  struct CreateCountryArgs: ArgumentsList {
    var code: String
    var name: String
    var languages: [String]
    var continentCode: String
  }
}
```

...and our mutation is ready to use in basically the same way as how we make queries - all we need to do is, instead of using the `.query`
function to build our operation, we use `.mutation`, calling fields from our schema's `mutation` type:

```swift
client.perform(.mutation {
  $0.createCountry(arguments: .init(code: "GV", name: "Genovia", languages: ["fr", "it", "en"], continentCode: "eu")) {
    $0.name
  }
}, completion: { _ in
  
})
```

### Input objects

Many GraphQL APIs will use input objects rather than long lists of arguments, especially if arguments are shared between fields. Let's 
imagine our countries API updated its schema so that the `createCountry` field took an input object instead of a long arguments list:

```
input CountryInput {
  code: String!
  name: String!
  languages: [String!]!
  continentCode: String!
}

type Mutation {
  createCountry(input: CountryInput!): Country!
}

```

This is supported in Artemis by defining types that conform to `Input` (which, like `ArgumentsList`, just requires that the type conform to
`Encodable`). This means that, most of the time, we'll just define a struct with all the properties of the input (that way, we get the
memberwise initializer for free!). The updated mutation API might then look like this:

```swift
struct CountryInput: Input {
  var code: String
  var name: String
  var languages: [String]
  var continentCode: String
}

final class Mutation: Object {
  @Field("createCountry")
  var createCountry: (Country, CreateCountryArgs.Type)
  
  struct CreateCountryArgs: ArgumentsList {
    var input: CountryInput
  }
}
```

Calling our `createCountry` field can then look like this:

```swift
let input = CountryInput(code: "GV", name: "Genovia", languages: ["fr", "it", "en"], continentCode: "eu")

client.perform(.mutation {
  $0.createCountry(input: .init(input: input)) {
    $0.name
  }
}, completion: { _ in
  
})
```
