# Artemis

<p align="center">
<img src="https://github.com/Saelyria/Artemis/actions/workflows/swift.yml/badge.svg" alt="Build status" />
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift5.3-compatible-4BC51D.svg?style=flat" alt="Swift 5.3 compatible" /></a>
<a href="https://raw.githubusercontent.com/Saelyria/Artemis/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

Artemis is a GraphQL library for Swift that lets you interact with a GraphQL backend entirely in Swift - no unsafe queries made of strings,
no `Data` or `[String: Any]` responses you need to parse though manually. Artemis uses `KeyPath` objects to keep track of types used 
in queries, so this request:

```swift
// Artemis                                  // Rendered GraphQL query
.query {                                    query {
    $0.country(alias: "canada") {               canada: country(code: "CA") {
        $0.name                                     name
        $0.continent {                              continent {
            $0.name                                     name
        }                                           }
    }.code("CA")                                }
}                                           }
```

...results in a `Partial<Country>` object that you can interact with using the same keypaths and type inference as a normal `Country` 
instance. Artemis will populate the response object with the fetched data - so this query (and its response) are handled like this:

```swift
let client = Client<Query>()

client.perform(.query { ... }) { result in
    switch result {
    case .success(let country):
        country.name // "Canada"
        country.continent?.name // "North America"
        country.languages // nil
    case .failure(let error):
        // error handling
    }
}
```

Don't let this simple example sell Artemis short, though - it includes full support for fragments, arguments, mutations, multiple query fields, 
and code generation from GraphQL schema documents [coming soon!] so you can get up and running with a new API in minutes. It's also very light 
(requiring only `Foundation`), so supports iOS, macOS, or anywhere else Swift and Foundation can run.

For instructions on adding Artemis to your project and setting up code generation, check out the [installation and setup](https://github.com/Saelyria/Artemis/tree/master/InstallationSetup.md) guide.

Once you're setup, you can check out the tutorial on [getting started with Artemis](https://github.com/Saelyria/Artemis/tree/master/GettingStarted.md)
guide to get up and running with making requests.

## Contributors

Aaron Bosnjak (email: aaron.bosnjak707@gmail.com, Twitter: @aaron_bosnjak)

Artemis is open to contributors! If you have a feature idea or a bug fix, feel free to open a pull request. Issues and feature ideas are tracked on
this [Trello board](https://trello.com/b/iDjeDfov/artemis).

## License

Artemis is available under the MIT license, so do pretty much anything you want with it. As always, see the LICENSE file for more info.
