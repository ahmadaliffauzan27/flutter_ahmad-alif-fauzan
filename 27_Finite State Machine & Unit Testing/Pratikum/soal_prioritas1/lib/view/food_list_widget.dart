import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/food_provider.dart';

class FoodListWidget extends StatefulWidget {
  @override
  _FoodListWidgetState createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodProvider>(context, listen: false).getFoodFromApi();
  }

  @override
  Widget build(BuildContext context) {
    final foodList = Provider.of<FoodProvider>(context).foodList;

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
