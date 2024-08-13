Tree View Application for Asset Management
Overview
This project is a dynamic Tree View Application designed to manage and visualize industrial assets, including locations, assets, and components. The application provides a hierarchical representation of assets, enabling users to explore and filter different components, assets, and locations efficiently.

Features
Dynamic Tree Structure: Visualizes the hierarchical relationship between locations, assets, and components.
Search Functionality: Allows users to search for specific assets, locations, or components within the tree structure.
Filtering:
Energy Sensors: Filter to isolate assets equipped with energy sensors.
Critical Status: Filter to identify assets with a critical operating status.
Responsive Design: Adapts to different screen sizes, ensuring usability on various devices.
Real-time Data Integration: Fetches data dynamically from a live API, reflecting real-time asset management.
Installation and Setup
Prerequisites
Flutter installed on your local machine.
An IDE such as Visual Studio Code or Android Studio.
Access to the internet for fetching data from the API.
Steps
Clone the repository:

bash
Copiar código
git clone https://github.com/yourusername/tree-view-application.git
cd tree-view-application
Install dependencies:

bash
Copiar código
flutter pub get
Run the application:

bash
Copiar código
flutter run
API Setup:

The application is configured to fetch data from the provided API endpoints:
/companies
/companies/:companyId/locations
/companies/:companyId/assets
No additional configuration is needed for the API integration.

Usage Instructions
Navigating the Tree View:

The main screen displays a tree view representing the hierarchy of locations, assets, and components.
Click on the expand/collapse arrows to navigate through different levels of the hierarchy.
Applying Filters:

Use the "Energy Sensors" and "Critical Status" buttons to filter the tree view based on these criteria.
The filters will dynamically update the tree view, displaying only relevant assets and components.
Using the Search Bar:

Enter keywords in the search bar to find specific assets, locations, or components.
The tree view will highlight and display items that match the search query.
Known Issues and Limitations
Large Data Sets: While the application is optimized for performance, very large data sets might cause some delay in rendering the tree view.
Future Enhancements:
Implement lazy loading or pagination for large data sets.
Enhance the UI/UX based on user feedback and usability testing.
Demo Video
Check out the demo video to see the application in action, showcasing the main features such as navigating the tree view, applying filters, and using the search functionality.

Credits and Acknowledgements
Libraries Used:
Flutter
GetX for state management.
Acknowledgements:
Thanks to the Tractian team for the API and project specifications.
Future Improvements
Lazy Loading: Implement lazy loading to enhance performance for large data sets.
UI/UX Enhancements: Further refine the user interface and experience based on real-world testing and feedback.
Additional Filters: Introduce more granular filters based on asset types, locations, and component status.