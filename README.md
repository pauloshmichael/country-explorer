# 🌍 Country Explorer App


- Name: Paulos
- ID:  ate/8171/15
- Course: Flutter Mobile Application Development
- Track: TRACK A — Country Explorer App

---

# 📖 Project Description

 This Country Explorer is a Flutter mobile application that allows users to explore countries around the world using the REST Countries API.

This application demonstrates:
- REST API integration
- Provider state management
- FutureBuilder
- Async programming
- Error handling
- Search functionality
- Responsive Flutter UI

Users can:
- View all countries
- Search countries by name
- View detailed country information
- Retry failed requests
- Handle internet/network errors gracefully

---

# 🚀 Features

##  Country List
Displays countries fetched from the API.

##  Search Countries
Users can search countries dynamically.

##  Country Details
Shows:
- Country name
- Flag
- Capital city
- Region
- Population

##  Error Handling
Handles:
- No internet connection
- Timeout errors
- API errors

##  Retry Button
Allows users to retry failed requests.

##  Loading Indicators
Displays loading progress while fetching data.

##  Provider State Management
Uses Provider + ChangeNotifier for app state management.

##  FutureBuilder
Used for asynchronous UI rendering.

---

# 🛠 Technologies Used

- Flutter
- Dart
- Provider
- HTTP Package
- REST API

---

# 🌐 API Used

REST Countries API:

https://restcountries.com/

Endpoints used:

## Get All Countries
https://restcountries.com/v3.1/all

## Search Country
https://restcountries.com/v3.1/name/{name}

---

# 📂 Project Structure

```text
lib/
├── main.dart
├── models/
│   └── country.dart
├── providers/
│   └── country_provider.dart
├── services/
│   ├── api_exception.dart
│   └── country_api_service.dart
└── screens/
    ├── home_screen.dart
    ├── search_screen.dart
    └── detail_screen.dart