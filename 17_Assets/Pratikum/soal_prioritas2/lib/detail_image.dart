import 'package:flutter/material.dart';
import 'package:task_gridview/theme.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Foto',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
      ),
      body: Image.network(
        imageUrl,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
