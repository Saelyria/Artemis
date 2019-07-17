# Artemis

Artemis is a GraphQL library for Swift that lets you interact with a GraphQL backend entirely in Swift - no unsafe queries made of strings,
no `Data` or `[String: Any]` responses you need to parse though manually. Blueprint uses `KeyPath` objects to keep track of types used 
in queries, so this:

```swift
// Blueprint                            // Rendered GraphQL query
Operation(.query) {                     // query {
    Add(\.country, alias: "canada") {   //    canada: country(code: "CA") {
        Add(\.name)                     //       name
        Add(\.continent) {              //       continent {
            Add(\.name)                 //          name
        }                               //       }
    }.code("CA")                        //    }
}                                       // }
```

...results in a `Partial<Country>` object that you can interact with using the same keypaths and type inference as a normal `Country` 
instance. Artemis will populate the response object with the fetched data - so this query (and its response) are handled like this:

```swift
let api = Graph<Query>()

api.perform(query) { result in
    switch result {
    case .success(let country):
        country.name // "Canada"
        country.continent?.name // "North America"
    case .failure(let error):
        // error handling
    }
}
```

Don't let this simple example sell Artemis short, though - it includes full support for fragments, arguments, mutations, multiple query fields, 
and ability to send over HTTP or over a custom networking setup, and generating your model objects from GraphQL schema documents so
you can get up and running with a new API in minutes. It's also very light (requiring only `Foundation`), so supports iOS, macOS, or 
anywhere else Swift and Foundation can run.
