import 'package:flutter/material.dart';
import 'package:soal_api/soal_prioritas1.dart';
import 'package:soal_api/soal_prioritas2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SoalPrioritas1(),
      home: SoalPrioritas2(),
    );
  }
}
