import 'dart:convert';
import 'package:http/http.dart' as http;

import '../food_model.dart';

class ApiFood {
  static const String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice';
  static const String food = '/foods';

  static Future<List<Food>> getFood() async {
    final response = await http.get(Uri.parse('$baseUrl$food'));

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      final List<Food> food =
          responseBody.map((e) => Food.fromJson(e)).toList();
      return food;
    } else {
      throw "Can't get the data";
    }
  }
}
