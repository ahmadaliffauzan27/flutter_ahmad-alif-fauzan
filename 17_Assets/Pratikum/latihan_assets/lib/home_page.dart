import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assets'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Image(
            image: AssetImage(
              'assets/foto1.jpg',
            ),
          ),
          // Text(
          //   'Green Lake',
          //   style: TextStyle(
          //     fontSize: 30,
          //     fontFamily: 'Rowdies',
          //   ),
          // ),
          Text(
            'Green Lake',
            style: GoogleFonts.rowdies(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
