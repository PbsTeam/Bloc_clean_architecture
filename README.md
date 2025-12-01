# 📦 Bloc Clean Architecture

A scalable Flutter project structure using **Clean Architecture + MVVM + BLoC + SOLID**, designed for real-world enterprise apps.

This README explains **each folder, why it exists, and what goes inside** — so any developer joining your project understands the architecture instantly.

---

## 🏗️ Project Folder Structure


```dart
lib/
│
├── config/
│ ├── colors/
│ ├── components/
│ └── routes/
│
├── core/
│ ├── api/
│ ├── constants/
│ ├── utils/
│ ├── local_storage/
│ └── validations/
│
├── data/
│ ├── datasources/
│ ├── models/
│ ├── repositories_impl/
│
├── domain/
│ ├── entities/
│ ├── repositories/
│ └── usecases/
│
├── presentation/
│ ├── viewmodel/
│ └── views/
│
├── main.dart
└── service_locator.dart
```

---

## 📌 Folder-by-Folder Explanation (Detailed)

---

# 1️⃣ **config/**

This folder stores **UI-related global configurations**.

---

### ✔ **colors/**
- Contains all app colors.
- Keeps theme values in one place.
- Example: `app_color.dart`

---

### ✔ **components/**
Reusable UI components shared across the app:

- `custom_button.dart`
- `app_textform_field.dart`
- `app_snack_bar.dart`
- `loader_widget.dart`
- `debouncing.dart`

These improve **consistency and reduce code duplication**.

---

### ✔ **routes/**
All navigation logic:

- `routes.dart` → defines pages
- `route_names.dart` → route name constants

Keeps navigation **centralized and maintainable**.

---

# 2️⃣ **core/**

Contains **base functionalities** used throughout the app.

---

### ✔ **api/**
Handles API communication.

- `api_response.dart` → success/error handler
- `base_api_service.dart` → common GET/POST methods
- `network_service.dart` → HTTP service

Used by datasources & repositories.

---

### ✔ **constants/**
Stores global constant values.

- `api_constants.dart` → Base URLs, Endpoints
- `image_constants.dart` → Local image paths

Centralized and easy to maintain.

---

### ✔ **utils/**
General helper utilities.

#### 🔹 **enums/**
All enums used in the app.

#### 🔹 **exceptions/**
Custom exceptions used in:

- API
- validation
- repositories

#### 🔹 **local_storage/**
Local storage helpers:

- `local_storage.dart` → handles read/write operations
- `app_storage_keys.dart` → keys in one place

---

### ✔ **validations/**
Form validations (email, password, etc.)  
Separated from UI for clarity and reusability.

---

# 3️⃣ **data/**

This is the **Data Layer** of Clean Architecture.

Responsible for calling APIs, mapping JSON → models.

---

### ✔ **datasources/remote/**
Handles actual API calls.

Examples:

- `login_remote_datasource.dart`
- `movies_remote_datasource.dart`

Each datasource:

- calls API
- receives JSON
- converts to Model

---

### ✔ **models/**
Data models using Freezed & JsonSerializable.

#### 🔹 **movie_modal/**
- `movie_modal.dart`
- `movie_modal.freezed.dart`
- `movie_modal.g.dart`

#### 🔹 **user/**
Same structure for user model.

Models convert JSON → Dart Objects.

---

### ✔ **repositories_impl/**
Implements domain repositories.

Examples:

- `movies_repository_impl.dart`
- `login_repository_impl.dart`

Each implementation:

- calls datasource
- converts model → entity
- handles exception
- returns domain-safe data

---

# 4️⃣ **domain/**

The **business logic layer**, independent of UI & Framework.

---

### ✔ **entities/**
Pure Dart classes that represent the business objects:

- `movie_entity.dart`
- `movies_list_entity.dart`
- `user_entity.dart`

Entities do NOT depend on the model or UI.

---

### ✔ **repositories/**
Abstract repository interfaces.

Example:

```dart
abstract class MoviesRepository {
  Future<MoviesListEntity> getMovies();
}
```

### ✔ **usecases/**

Business operations.
Each use case performs 1 business action.

Example:

- `get_movies_usecase.dart`
- `login_usecase.dart`


### ✔ **presentation/**

Contains everything UI-related.

### **viewmodel/**

MVVM ViewModels (usually using BLoC or Cubit).

Examples:

- `login_viewmodel.dart`
- `movies_viewmodel.dart`


### **views/**
UI screens/pages.


Examples:


- `login_view.dart`
- `movies_list_view.dart`


🔧 Dependency Injection (service_locator.dart)

This file configures GetIt or any DI container.

You typically register:

### **datasources**

### **repositories**

### **usecases**

### **viewmodels**


Example:


```dart
locator.registerLazySingleton<MoviesRepository>(
() => MoviesRepositoryImpl(locator()),
);
```



⭐ Features

Clean Architecture (Modular & Scalable)

MVVM + BLoC for predictable UI state

Repository Pattern

Centralized routing

Reusable components system

Global exception handling

Strongly typed models & entities

Easy testing and maintenance


## Screenshots

Here are some screenshots of the example app demonstrating the key features of this package:

### Screenshot 1
<img src="https://raw.githubusercontent.com/PbsTeam/Provider_feature_first/main/assets/screenshots/screenshots_00.png" alt="Home Screen" width="300"/>

### Screenshot 2

<img src="https://raw.githubusercontent.com/PbsTeam/Provider_feature_first/main/assets/screenshots/screenshots_01.png" alt="Home Screen" width="300"/>

### Screenshot 3

<img src="https://raw.githubusercontent.com/PbsTeam/Provider_feature_first/main/assets/screenshots/screenshots_02.png" alt="Home Screen" width="300"/>


### Screenshot 4

<img src="https://raw.githubusercontent.com/PbsTeam/Provider_feature_first/main/assets/screenshots/screenshots_03.png" alt="Home Screen" width="300"/>





