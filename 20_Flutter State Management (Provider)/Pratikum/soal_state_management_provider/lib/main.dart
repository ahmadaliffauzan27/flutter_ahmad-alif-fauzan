import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_gridview/image_provider.dart';
import 'theme.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImgProvider>(
      create: (_) => ImgProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Gallery',
        theme: ThemeData(primaryColor: primaryColor),
        home: HomePage(),
      ),
    );
  }
}
