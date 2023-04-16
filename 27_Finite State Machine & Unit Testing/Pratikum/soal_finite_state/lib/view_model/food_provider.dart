import 'package:flutter/material.dart';

import '../model/apis/food_apis.dart';
import '../model/food_model.dart';

abstract class FoodState {
  Future<void> getFood(FoodProvider provider);
}

class LoadingState implements FoodState {
  @override
  Future<void> getFood(FoodProvider provider) async {
    try {
      provider._foodList = await ApiFood.getFood();
      provider._state = LoadedState();
    } catch (error) {
      provider._state = ErrorState();
      rethrow;
    } finally {
      provider.notifyListeners();
    }
  }
}

class LoadedState implements FoodState {
  @override
  Future<void> getFood(FoodProvider provider) async {}
}

class ErrorState implements FoodState {
  @override
  Future<void> getFood(FoodProvider provider) async {}
}

class FoodProvider extends ChangeNotifier {
  List<Food> _foodList = [];
  FoodState _state = LoadingState();

  List<Food> get foodList => _foodList;
  FoodState get state => _state;

  Future<void> getFoodFromApi() async {
    await _state.getFood(this);
  }
}
