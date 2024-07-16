# iOS APP

## Project Overview
This project is an iOS application that displays a greeting based on the local time and creates charts from data fetched from an API. It includes various views to manage different sections of the user interface.
![MasterHead](https://github.com/saiaswath07/Ios-app-devtest/blob/main/phone_view1.png)

## Features
1. **Greeting Display**: Displays a greeting message based on the local time.
2. **Data Fetching**: Fetches data from an API using the `DataFetcher` class.
3. **Chart Creation**: Creates charts from the fetched data.
4. **Responsive Design**: Supports different devices.
5. **Dynamic Views**: Includes multiple SwiftUI views for different sections of the user interface.
6. **Tabs for Navigation**: Provides tabs for viewing top links and recent links.

## Approach

### Display Greeting from Local Time
The application determines the local time and displays an appropriate greeting.

### Creating Charts
1. **Fetch Data**: Data is fetched from the API using the `DataFetcher` class.
2. **Extract Chart Data**: Extracts the `overallUrlChart` property from the fetched data.
3. **Create Chart**: Uses a charting library or SwiftUI's built-in drawing capabilities to create a chart.

### Data Fetching
1. **Setup API Request**: Creates a URL object and a URLRequest object with the API URL.
2. **Headers and Method**: Sets the HTTP method to "GET" and includes headers for "Accept" and "Authorization".
3. **Data Task**: Uses `URLSession.shared.dataTask` to fetch data in the background.
4. **Completion Handler**: Decodes the data into an `APIResponse` object and updates the `fetchedData` property.

### Views
1. **ContentView**: The primary view that integrates various subviews using `DataFetcher`.
   - Includes: `nav_tab`, `header_view`, `greeting_view`, `show_graph`, `horz_cards`, `analytics_button`, `tabs_view`.
2. **LinkView**: Displays individual links.
3. **Recent_LinkView**: Displays recent links.

### Tabs and List Views
Adds tabs for "Top links" and "Recent links" and creates list views to display data from the API response.
![MasterHead](https://github.com/saiaswath07/Ios-app-devtest/blob/main/phone_view2.png)
![MasterHead](https://github.com/saiaswath07/Ios-app-devtest/blob/main/phone_view3.png)
![MasterHead](https://github.com/saiaswath07/Ios-app-devtest/blob/main/phone_view4.png)
![MasterHead](https://github.com/saiaswath07/Ios-app-devtest/blob/main/phone_view5.png)
![MasterHead](https://github.com/saiaswath07/Ios-app-devtest/blob/main/phone_view6.png)

