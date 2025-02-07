# iOS Code Challenge - Rick and Morty Search App

This app provides users a way to search for information about Rick and Morty characters by querying the Rick and Morty API. The app provides the user with a search bar to look up a character of their choosing by name, as the user types their search they will be able to see information such as character's image, name, and species type in a grid view layout where they can tap on a search result to see more information about the character.

## Architecture and UI
The Rick and Morty search app was built entirely in SwiftUI and uses the MVVM (Model-View-ViewModel) architecture.

## Accessibility Support
- Voice Over
- Dynamic Type/Text 

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

## App Screenshots
![character-search-empty](https://github.com/user-attachments/assets/57c87d80-c22c-4df6-a308-71ccd2f8f7b5)
![character-search-portrait](https://github.com/user-attachments/assets/e0b512b5-4033-4274-bd2d-31034b875173)
![character-search-landscape](https://github.com/user-attachments/assets/757e726f-5596-4b66-8347-5c147a288c23)
![character-detail](https://github.com/user-attachments/assets/39787ed9-6bb3-4493-ad6f-23a9b791171e)
