# iOS Code Challenge - Rick and Morty Search App

This app provides users a way to search for information about Rick and Morty characters by querying the Rick and Morty API. The app provides the user with a search bar to look up a character of their choosing by name, as the user types their search they will be able to see information such as character's image, name, and species type in a grid view layout where they can tap on a search result to see more information about the character.

## Architecture and UI
The Rick and Morty search app was built entirely in SwiftUI and uses the MVVM (Model-View-ViewModel) architecture.

## Accessibility Support
##### Voice Over
##### Dynamic Type/Text 

## Third Party Libraries

No third party libraries were used in the development of this app

## Test Automation
For test automation, I created a couple of UI tests one of which test navigating from the character search screen over to the character detail screen ensuring that expected UI elements are visible. The second unit test checks for dynamic type accessiblity support on all screens in the app by running an accessibility audit.

## Documentation
- Rick and Morty API:
https://rickandmortyapi.com/documentation/#rest

- Apple:
https://developer.apple.com/documentation/xctest/user-interface-tests
https://developer.apple.com/documentation/swiftui/lazyvgrid
https://developer.apple.com/documentation/swiftui/sharelink
