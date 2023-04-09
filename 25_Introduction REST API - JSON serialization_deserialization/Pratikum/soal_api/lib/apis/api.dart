import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/model.dart';

final Dio dio = Dio();

class Services {
  // baca data
  Future readUser() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
          "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts");

      log("Fetch data kedalam Json");
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  // generate image
  String imgUrl = '';

  Future getImage() async {
    final Response response =
        await dio.get('https://api.dicebear.com/6.x/lorelei/svg');

    imgUrl = response.data;
    log(imgUrl);
    return response;
  }

  Future getImageInput(String inputNameImage) async {
    final Response response = await dio
        .get('https://api.dicebear.com/6.x/pixel-art/svg?seed=$inputNameImage');

    imgUrl = response.data;
    log("input is : $inputNameImage");
    log(response.data);
    return response;
  }

  // metode POST Prioritas 1
  Future createUser({
    required String name,
    required String phone,
  }) async {
    final Response response = await dio.post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
        data: {'name': name, 'phone': phone});

    final User userModels = User.fromJson(response.data);
    log('POST');
    log('DATA : ${response.data.toString()}');
    return response.data;
  }

  Future update({
    required String name,
    required String phone,
  }) async {
    try {
      int id = 1;
      final Response response = await dio.put(
        'https://jsonplaceholder.typicode.com/posts/$id',
        data: {
          "id": 1,
          "title": 'foo',
          "body": 'bar',
          "userId": 1,
        },
      );

      log("PUT");
      log("PUT ID $id");
      log(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser(int id) async {
    try {
      final Response response = await dio.delete(
        'https://jsonplaceholder.typicode.com/posts/$id',
      );

      log("DELETE");
      log("DELETE ID $id");
      log(response.data.toString());
      log("Deleted ID: ${response.data["id"]}");

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
