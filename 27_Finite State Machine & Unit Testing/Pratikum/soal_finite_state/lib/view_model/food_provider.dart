import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/apis/food_apis.dart';
import '../model/food_model.dart';

enum FoodState {
  initial,
  loading,
  loaded,
  error,
}

class FoodProvider extends ChangeNotifier {
  List<Food> _foodList = [];
  FoodState _state = FoodState.initial;

  List<Food> get foodList => _foodList;
  FoodState get state => _state;

  void getFoodFromApi() {
    _state = FoodState.loading;
    ApiFood.getFood().then((foodList) {
      _foodList = foodList;
      _state = FoodState.loaded;
      notifyListeners(); // Move this call here
    }).catchError((error) {
      _state = FoodState.error;
      notifyListeners();
      throw error;
    });
  }
}

class FoodListWidget extends StatefulWidget {
  @override
  _FoodListWidgetState createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<FoodProvider>(context, listen: false).getFoodFromApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);

    switch (foodProvider.state) {
      case FoodState.loading:
        return Center(child: CircularProgressIndicator());
      case FoodState.error:
        return Center(child: Text('Error fetching data'));
      default:
        final foodList = foodProvider.foodList;

        return ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (BuildContext context, int index) {
            final food = foodList[index];
            return ListTile(
              title: Text(food.name),
            );
          },
        );
    }
  }
}
