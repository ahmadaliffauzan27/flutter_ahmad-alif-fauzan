import 'package:flutter/material.dart';
import 'package:task_gridview/flutter_gallery.dart';
import 'package:task_gridview/section13/material_page.dart';
import 'package:task_gridview/section15/home_section15.dart';
import 'package:task_gridview/section16_advance_form/main.dart';
import 'section16_form/main.dart';
import 'package:task_gridview/section16_form/main.dart';
import 'section12/home_section12.dart';
import 'detail_image.dart';
import 'theme.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Gallery',
        theme: ThemeData(primaryColor: primaryColor),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/section12': (context) => const HomeSection12(),
          '/section13': (context) => const HomeSection13(),
          '/section15': (context) => const HomeSection15(),
          '/section16': (context) => const HomeForm(),
          '/section16_2': (context) => const HomeFormAdvance(),
          '/gallery': (context) => FlutterGallery(),
          '/detail': (context) => DetailPage(),
        });
  }
}
