import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tugas_finite_state/model/apis/food_apis.dart';
import 'package:tugas_finite_state/model/food_model.dart';
import 'mocking.mocks.dart';

@GenerateMocks([ApiFood])
void main() {
  group('ApiResep', () {
    ApiFood apiFood = MockApiFood();

    test('get all foods return data', () async {
      when(ApiFood.getFood()).thenAnswer(
        (_) async => <Food>[
          Food(id: 1, name: 'Baso'),
        ],
      );
      var foods = await ApiFood.getFood();
      expect(foods.isNotEmpty, true);
    });
  });
}
