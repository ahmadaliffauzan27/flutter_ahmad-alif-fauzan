import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      title: 'Hallo Alterra',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          title: Text(
            'Hallo Alterra',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
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
          ),
        );
  }}