import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

class FoodDataService {
  //get all food items
  Future<List<FoodModel>> getAllFoods() async {
    try {
      print('calling get foods data service');
      //load json from assets
      final String response = await rootBundle.loadString(
        'assets/json_data/food_data.json',
      );
      final List<dynamic> data = jsonDecode(response);

      return data.map((e) => FoodModel.fromJson(e)).toList();
    } catch (e) {
      print('error in getting foods: $e');
      return [];
    }
  }

  //get food by id
  Future<FoodModel?> getFoodById(String id) async {
    try {
      final foods = await getAllFoods();
      return foods.firstWhere((food) => food.id == id);
    } catch (e) {
      return null;
    }
  }

  //get food by category
  Future<List<FoodModel>> getFoodsByCategory(String category) async {
    try {
      final foods = await getAllFoods();
      return foods.where((food) => food.category == category).toList();
    } catch (e) {
      return [];
    }
  }
}
