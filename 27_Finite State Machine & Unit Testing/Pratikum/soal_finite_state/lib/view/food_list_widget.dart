import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/food_provider.dart';

class ListFoodWIdget extends StatefulWidget {
  const ListFoodWIdget({super.key});

  @override
  _ListFoodWIdgetState createState() => _ListFoodWIdgetState();
}

class _ListFoodWIdgetState extends State<ListFoodWIdget> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodProvider>(context, listen: false).getFoodFromApi();
  }

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);

    if (foodProvider.state == FoodState.loading) {
      return Center(child: CircularProgressIndicator());
    } else if (foodProvider.state == FoodState.error) {
      return Center(child: Text('Error fetching data'));
    } else {
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
