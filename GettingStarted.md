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

First things first, we'll look at `Field`s. In this guide, we'll be using a countries GraphQL API found [here](https://countries.trevorblades.com),
building on it where appropriate to demo different features. Running this API's schema through Artemis' codegen tool gives us a bunch of 
model schema files that look something like this:

```swift
import Artemis

final class Continent: Object, ObjectSchema {

   var code = Field<String?, NoArguments>("code")

   var name = Field<String?, NoArguments>("name")

   var countries = Field<[Country?]?, NoArguments>("countries")
}
```
A lot of this `Continent` type can be inferred from reading it, but there's a handful of things that might look a little peculiar so that we can
map the GraphQL query language into Swift while taking full advantage of Swift's type safety.

The most important bits are the `Field` properties on our `Continent` - `code`, `name`, and `countries`. `Field` properties first declare
the returned type of the field, then a struct that contains all the arguments to the field. We'll get to arguments later - for now, none of these
fields have arguments, so this is set to `NoArguments`.
