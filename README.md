
Nestafar Flutter Food Ordering App
Overview
This project is a Flutter application demonstrating a single workflow for ordering food from local restaurants. It is designed for internship evaluation and closely follows the provided assignment guidelines, focusing on local workflow, Bloc state management, and clean code architecture.

Features
Browse restaurant list (with name, status, rating, and distance)

View foods by restaurant and filter by category

Add/remove food items to cart

Review and place orders with order history and status

State management using Bloc

Local data storage in JSON files (assets/data/foods.json, assets/data/restaurants.json, assets/data/cart.json)

Error handling and UI feedback using Snackbars and loading indicators

Unit tests for workflow logic

Folder Structure
text
lib/
 ├── core/                 # Global widgets, utils
 ├── features/
 │    ├── food/
 │    ├── cart/
 │    ├── order/
 │    └── restaurant/
 ├── assets/
 │    ├── data/
 │    │     ├── foods.json
 │    │     ├── restaurants.json
 │    │     └── cart.json
 │    └── images/
 │          ├── food             # sample food images
 │          └── restro_image     # sample restaurant images
Architecture
Bloc: All business logic handled using the Bloc pattern. Separation of presentation, domain, and data layers.

SOLID principles: Modularized workflows and repositories, single responsibility in all blocs and models.

Local JSON: All workflow data sourced from static JSON files in assets (no login, API, or real-time DB).

Error Handling
All screens validate and handle common errors:

Missing or malformed JSON

Failed cart/order operations

Empty states gracefully handled

UI feedback via Snackbars for success/error.

How to Run
Clone the repo

text
git clone https://github.com/yourusername/nestafar_flutter_food_delivery.git
cd nestafar_flutter_food_delivery
Install dependencies

text
flutter pub get
Add assets

Ensure the assets/data/ folder has foods.json, restaurants.json, and cart.json.

Ensure the assets/images/ folder contains sample food and restaurant images.

Assets in pubspec.yaml

text
flutter:
  assets:
    - assets/data/foods.json
    - assets/data/restaurants.json
    - assets/data/cart.json
    - assets/images/food
    - assets/images/restro_image
Run the app

text
flutter run
Screenshots
Add screenshots to the README or in the repo showing:

Restaurant list

Food grid and categories

Cart, Orders, and Order status pages

Testing
Unit tests are present for core workflow logic. Run with:

text
flutter test
Notes
All data is stored and fetched locally; no network required.

No user authentication; single workflow only.

Code is architected for extensibility but only core screens needed for evaluation are present.

Food/cart updates are written to a writable JSON using path_provider if mutation is needed; reference implementation covers local storage for persistence.

Instructions for Reviewers
To try the app, open the project in your editor and run flutter run from the terminal.

To change restaurants, foods, or categories, edit the corresponding JSON in assets/data.

Refer to Bloc structure in features for understanding state management logic.

Author
Abhishek Singh
