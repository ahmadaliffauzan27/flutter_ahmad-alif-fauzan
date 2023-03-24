import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_gridview/theme.dart';

void main() {
  runApp(const HomeSection12());
}

class HomeSection12 extends StatelessWidget {
  const HomeSection12({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hallo Alterra'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Text(
          'Nama Saya Ahmad Alif Fauzan',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
