
# Nestafar Flutter Food Ordering App
## Overview
### This project is a Flutter application demonstrating a single workflow for ordering food from local restaurants. It is designed for internship evaluation and closely follows the provided assignment guidelines, focusing on local workflow, Bloc state management, and clean code architecture.

## Features
    - Browse restaurant list 
    - View foods by restaurant and filter by category

    - Add/remove food items to cart

    - Review and place orders with order history and status

    - State management using Bloc

    - Local data storage in JSON files (assets/data/foods.json, assets/data/restaurants.json)

    - Error handling and UI feedback using Snackbars and loading indicators

    - Unit tests for workflow logic


## Architecture
    - Bloc: All business logic handled using the Bloc pattern. Separation of presentation, domain, and data layers.

    - SOLID principles: Modularized workflows and repositories, single responsibility in all blocs and models.

    - Local JSON: All workflow data sourced from static JSON files in assets (no login, API, or real-time DB).

## Error Handling
    - All screens validate and handle common errors:

    - Missing or malformed JSON

    - Failed cart/order operations

    - Empty states gracefully handled

    - UI feedback via Snackbars for success/error.

## How to Run
### Clone the repo

```
git clone https://github.com/unim26/nestafar_task
cd nestafar_task
```

## Install dependencies

```
flutter pub get
```

## Add assets

    - Ensure the assets/data/ folder has foods.json and  restaurants.json.

    - Ensure the assets/images/ folder contains sample food and restaurant images.

## Assets in pubspec.yaml

```
flutter:
  assets:
    - assets/data/foods.json
    - assets/data/restaurants.json
    - assets/images/food
    - assets/images/restro_image

```
## Run the app

```
flutter run

```

## Screenshots


## Testing![13](https://github.com/user-attachments/assets/91987bfc-7e35-48bc-871e-03f767f7c3ab)
![9](https://github.com/user-attachments/assets/89f10da8-1426-4154-ac72-dba3b8244ea6)
![12](https://github.com/user-attachments/assets/f4349570-7f62-40ed-b41a-bc90c2925eb3)
![7](https://github.com/user-attachments/assets/b6c9db53-7c10-4ffd-b146-0c379cd7b1c8)
![5](https://github.com/user-attachments/assets/b45ca66d-a49c-4199-a731-07f583676072)
![3](https://github.com/user-attachments/assets/bab558ce-ba6c-411d-b6f4-aeffd11920a1)
![1](https://github.com/user-attachments/assets/26301d88-6e45-4d14-b81d-1e4a57f31b16)
![11](https://github.com/user-attachments/assets/e73ad79d-2136-4720-b21f-a700b87e86b7)
![2](https://github.com/user-attachments/assets/c285d25d-00e8-43ef-8a56-15993386c8d5)
![4](https://github.com/user-attachments/assets/2e9c8354-e4f5-4cfb-9a65-fc75d176cd61)
![6](https://github.com/user-attachments/assets/6ab5dadb-4de9-468a-b59e-01cd8699b7a3)
![8](https://github.com/user-attachments/assets/ca2fba98-c2f7-4d17-ae27-f714db279bdd)
![10](https://github.com/user-attachments/assets/5ec4b54d-11e7-41b6-ae9f-6e34bae6e65f)

 ### Unit tests are present for core workflow logic. Run with:

```
flutter test
```
## Notes
    - All data is stored and fetched locally; no network required.

    - No user authentication; single workflow only.

    - Code is architected for extensibility but only core screens needed for evaluation are present.

    - Food/cart updates are written to a writable JSON using path_provider if mutation is needed; reference implementation covers local storage for persistence.

## Instructions for Reviewers
    - To try the app, open the project in your editor and run flutter run from the terminal.

    - To change restaurants, foods, or categories, edit the corresponding JSON in assets/data.

    - Refer to Bloc structure in features for understanding state management logic.

### Author
# Abhishek Kumar
