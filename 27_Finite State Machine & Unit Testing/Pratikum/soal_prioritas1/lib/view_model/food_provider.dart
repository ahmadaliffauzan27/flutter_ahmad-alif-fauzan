import 'package:flutter/material.dart';

import '../model/apis/food_apis.dart';
import '../model/food_model.dart';

class FoodProvider extends ChangeNotifier {
  List<Food> _foodList = [];

  List<Food> get foodList => _foodList;

  Future<void> getFoodFromApi() async {
    try {
      _foodList = await ApiFood.getFood();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
