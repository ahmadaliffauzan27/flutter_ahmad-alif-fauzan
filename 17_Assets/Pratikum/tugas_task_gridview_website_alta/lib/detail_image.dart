import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;

  const DetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Gambar'),
      ),
      body: Image.network(
        imageUrl,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        // alignment: Alignment.center,
      ),
    );
  }
}
