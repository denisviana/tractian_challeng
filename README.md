# Tree View Application for Asset Management

## Overview

This project is a dynamic Tree View Application designed to manage and visualize industrial assets, including locations, assets, and components. The application provides a hierarchical representation of assets, enabling users to explore and filter different components, assets, and locations efficiently.

## Features

- **Dynamic Tree Structure:** Visualizes the hierarchical relationship between locations, assets, and components.
- **Search Functionality:** Allows users to search for specific assets, locations, or components within the tree structure.
- **Filtering:**
    - **Energy Sensors:** Filter to isolate assets equipped with energy sensors.
    - **Critical Status:** Filter to identify assets with a critical operating status.
- **Responsive Design:** Adapts to different screen sizes, ensuring usability on various devices.
- **Real-time Data Integration:** Fetches data dynamically from a live API, reflecting real-time asset management.

## Installation and Setup

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your local machine.
- An IDE such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- Access to the internet for fetching data from the API.

### Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/tree-view-application.git
   cd tree-view-application

2. **Install dependencies:**

   ```bash
   flutter pub get
   
3. **Run the application:**

   ```
    flutter run
    ```

## API Setup:

- The application fetches data from a live API to populate the tree structure.
- You can use the following API endpoints to retrieve data:

  - `/companies`
  - `/companies/:companyId/locations`
  - `/companies/:companyId/assets`

## Usage Instructions

1. **View Tree Structure:**
   - Explore the hierarchical relationship between locations, assets, and components.
   - Click on the arrow icons to expand or collapse the tree nodes.

2. **Search for Assets:** 
   - Use the search bar to find specific assets, locations, or components within the tree structure.
   - The tree view will automatically navigate to the searched item.

3. **Filter Assets:**
   - Use the filter options to isolate assets with energy sensors or critical status.
   - The tree view will display only the assets that match the selected filters.

## Demo Video

[![Watch the video](https://github.com/user-attachments/assets/ccbae0c8-0819-42fc-8018-c42ac0103cbf)

## Credits and Acknowledgements
- Libraries Used
  - [GetX](https://pub.dev/packages/get) for state management.
  - [Dio](https://pub.dev/packages/dio) for network requests.
  - [GetIt](https://pub.dev/packages/get_it) for dependency injection.
  - [Flutter](https://flutter.dev/) for building the application.

## Improvements
- Named routes navigation.
- Unit tests for components.
- Error handling for network requests.
- Integration with a backend server for data storage.
