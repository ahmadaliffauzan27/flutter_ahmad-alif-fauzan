// import 'package:test/test.dart';
// import 'package:tugas_finite_state/model/apis/food_apis.dart';

// void main() {
//   test('get all foods', () async {
//     var foods = await ApiFood.getFood();
//     expect(foods.isNotEmpty, true);
//   });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tugas_finite_state/view_model/food_provider.dart';

void main() {
  test('getFoodFromApi should return a list of foods', () async {
    final foodProvider = FoodProvider();

    await foodProvider.getFoodFromApi();

    expect(foodProvider.foodList.length, greaterThan(0));
  });
}
