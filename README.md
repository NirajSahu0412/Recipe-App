# Recipe App Documentation


## Overview
The Recipe App is a Flutter application designed to allow users to browse, search, and save recipes. It provides features to fetch recipe information such as title, image, ingredients, and instructions. The app incorporates state management using the BLoC (Business Logic Component) pattern to manage app-wide state effectively. Users can save their favorite recipes for future reference and view/manage saved recipes in a separate section of the app.

## Features
1. Search Recipe:
Search for your desire recipe according to the name and ingredient.
2. Recipe Details:
Provides a recipe detail screen to show detailed information about a selected recipe, including ingredients and instructions.
3. Save Functionality:
Allows users to save their favorite recipes for future reference. You can view your saved recipes in separate screen.

## Architecture

For this application, I have used Bloc Architecture. File structure is :
* bloc/
* data/
* presentation/
* utils/
* main.dart

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
