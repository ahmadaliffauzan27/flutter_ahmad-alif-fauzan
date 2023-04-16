import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_finite_state/view/food_list_widget.dart';
import 'package:tugas_finite_state/view_model/food_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Food List'),
          ),
          body: const ListFoodWIdget(),
        ),
      ),
    );
  }
}
