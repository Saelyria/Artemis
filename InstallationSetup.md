# Installation and setup

## Adding Artemis to your project

To get started using Artemis, the first step is to add it as a dependency with Swift Package Manager. In Xcode, select your Xcode project
file in the left pane, select your app target under 'Targets' in the left panel, then press the '+' button under 'Frameworks, Libraries, and 
Embedded Content'. In the sliding popout menu, press 'Add Other', then 'Add Package Dependency'. In the text field at the top labeled 
'Enter package repository URL', enter 'https://github.com/Saelyria/Artemis', then tap 'Next'. Choose the versioning rule appropriate for 
your project, then follow the rest of the setup until Artemis is added.

## Setting up API schema generation

To use Artemis to make requests to a GraphQL API, you need Swift classes that contain all the fields and types used in that API's schema.
Artemis can generate these Swift classes based on a document of the API in the GraphQL 'schema language'. This is the file that will 
contain all the types and fields for your GraphQL API, containing definitions like this:

```
type Character {
  name: String!
  appearsIn: [Episode!]!
}
```

[Here](https://github.com/graphql/swapi-graphql/blob/master/schema.graphql) is the sample Star Wars API schema document looks like.
This document is something that whoever maintains or develops the GraphQL API you want to program against should be able to provide 
you. Once you get a copy of this document, add it to your Xcode project as a plain text file. In this guide, we'll assume you named it
`schema.graphql`, but feel free to name it however you want.

When Artemis is installed with Swift Package Manager, it will also add an 'Artemis-Generate' scheme to your Xcode workspace that
you can select from the drop-down at the top left (next to the 'Run' and 'Stop' button in Xcode) and run to generate your API schema. At
this point, we have two options for how we want to generate models - we can set this scheme up to just be run, or we can setup a build
step on our project so that whenever it's run, we re-generate the API schema. We'll go over each option below.

### Setting up the 'Artemis-Generate' scheme to be manually runnable

If you only want to generate the Swift schema classes when you explicitly run the generator tool, then this is the option you want. Select
the 'Artemis-Generate' scheme from the Xcode scheme drop-down at the top-left of Xcode, then select 'Edit Scheme' from the
bottom of the drop-down. Select 'Run' in the left-side pane, then 'Arguments'. Add a new field under 'Arguments Passed on Launch' then,
as the value for the field, add `--input` followed by the path to the `schema.graphql` file in your Xcode project. The total value would
then look something like `--input /Users/Name/Documents/MyCoolApp/schema.graphql`.

> Unfortunately, Xcode environment variables aren't available to this script when using this method, so you need the full path for your 
machine.

Then, in the second field, you'll specify a path to a folder for the generated Swift schema files, starting with `--output`. This might look
something like  `--output /Users/Name/Documents/MyCoolApp/Schema`.

Once these two arguments are setup, press 'Close', select the target for the 'Artemis-Generate' scheme to be 'My Mac' (there might be
multiple options here, any should work), and run it. The generated Swift files should show up in the folder and can then be added to the 
project in Xcode.

### Setting up automatic generation

Swift schema generation can also be set up to run whenever you build your project. First, we'll need the built executable of the 
Artemis-Generate' scheme. By default, when you select the generation scheme and build/run it, it'll dump the executable in your project's
derived data folder. You can find it by going to the menu under Xcode > Preferences > Locations, then tapping the little circle arrow next to
the path under 'Derived Data'. Then, all else being equal, it'll be under the DerivedData folder, then the folder for the project (it'll start with 
your project name followed by a bunch of random characters), then Build > Products > Debug.

You can choose to leave this executable where it is, or move it out of derived data into somewhere in your project so it gets checked into
your project's repo. You might do this if you want the build phase to be run as part of a continuous integration (CI) service like Bitrise or 
Travis. For this guide, we'll leave it here in derived data.

Next, open your Xcode project file, then go to 'Build Phases'. Press the '+' button in the top-left and select 'New Run Script Phase'. This
lets us add a new shell script that gets run anytime our project is built. Name the new script phase 'Generate GraphQL API', then drag it so
it comes before the 'Compile Sources' phase. Next, add the following to the script:

```
cd "$BUILD_DIR"/Debug

./Artemis-Generate --input "$PROJECT_DIR"/schema.graphql --output "$PROJECT_DIR"/Models
```

Making sure to match the actual file paths to where your schema file and desired output folder is. The 'change directory' command at the
top should change to the folder containing the 'Artemis-Generate' executable - if you left it in derived data, `"$BUILD_DIR"/Debug` will
lead to it.

Build or run your project and, if all your file paths were correct, Artemis should generate all the types in separate files into the specified 
folder - then, you're good to start querying your API!
