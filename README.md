# Character Search App

Character Search App is a Flutter project that allows users to search and view characters' information from two different endpoints. The app is built using Flutter's BLoC architecture for state management and provides an adaptive UI for both phones and tablets. It also includes some test coverage for critical app functionality to ensure stability and reliability.

## Features

- Search characters from two different endpoints: one for "The Simpsons" and "The Wire".
These are, respectively,
http://api.duckduckgo.com/?q=simpsons+characters&format=json 
https://api.duckduckgo.com/?q=the+wire+characters&format=json
- Utilizes Flutter's BLoC pattern for efficient state management.
- Adaptive UI design for both phone and tablet devices.
- Some testign for critical app functionality included to ensure code quality and reliability.
- Easily switch between different character endpoints using app flavors.

## Flavors

The app supports two flavors:

1. **The Simpsons Flavor:** Connects to endpoint "http://api.duckduckgo.com/?q=simpsons+characters&format=json" for fetching character information.
2. **The Wire Flavor:** Connects to Endpoint "https://api.duckduckgo.com/?q=the+wire+characters&format=json" for fetching character information.

You can select the desired flavor by specifying the flavor during build inside 'main.dart' or by using build configurations.

## Getting Started

1. **Prerequisites:**
   - Ensure you have Flutter and Dart installed. If not, follow the instructions in the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/villegas-abva/character-search-app.git
   cd character-search-app
