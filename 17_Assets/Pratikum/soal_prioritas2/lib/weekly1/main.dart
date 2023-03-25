import 'package:flutter/material.dart';
import 'package:task_gridview/weekly1/theme.dart';
import 'home_page.dart';

void main() {
  runApp(const Weekly1());
}

class Weekly1 extends StatelessWidget {
  const Weekly1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly 1'),
        backgroundColor: primaryColor,
      ),
      body: const HomePage(),
    );
  }
}
