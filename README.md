# 🛍️ Store Products Viewer

A modern Flutter products viewer application built using **Clean Architecture** principles and **Cubit State Management**.  
The app fetches products from a REST API and displays them in a responsive and user-friendly UI.

---

# ✨ Features

- Fetch products from API using Dio
- Display products in responsive GridView
- Product card contains:
  - Product image
  - Product title
  - Product description
  - Discounted price
  - Original price with line-through
  - Product rating
  - Favorite button
  - Add to cart button
- Snackbar feedback when adding products to cart
- Responsive UI using MediaQuery
- Clean Architecture structure
- State management using Cubit
- Loading and error handling

---

# 🏗️ Architecture

The application follows:

- Clean Architecture
- MVVM (Model - View - ViewModel)
- Cubit State Management

### MVVM Layers

- **Model** → Product model and API data
- **View** → UI screens and widgets
- **ViewModel** → Cubit for business logic and state management

---

# 🗂️ Project Structure

```bash
lib/
│
├── features/
│   └── products/
│       ├── data/
│       │   ├── models/
│       │   └── services/
│       │
│       ├── viewmodels/
│       │   └── cubits/
│       │
│       ├── views/
│       │
│       └── widgets/
│
└── main.dart
```

---

# 🚀 Technologies Used

- Flutter
- Dart
- Flutter Bloc / Cubit
- Dio
- REST API
- Clean Architecture

---

# 🌐 API Used

```bash
https://dummyjson.com/products
```

---

# 🔄 State Management

The application uses **Cubit** for:

- Loading products
- Success state handling
- Error handling

### States:
- ProductInitial
- ProductLoading
- ProductLoaded
- ProductError

---

# 🎨 UI Features

## Product Card

Each product card contains:

- Product image
- Favorite toggle button
- Product title
- Product description
- Discounted price
- Original price
- Product rating
- Add-to-cart button
- Snackbar interaction

---

# ▶️ Getting Started

## Install dependencies

```bash
flutter pub get
```

## Run the app

```bash
flutter run
```
<img width="2348" height="1799" alt="products_list_screens" src="https://github.com/user-attachments/assets/11130815-76cb-4b3c-a87f-1c0efed7bed3" />
