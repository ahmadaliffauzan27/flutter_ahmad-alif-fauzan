import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDecorationStyle {
  static inputDecorationStyle(String labelText) => InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 1),
        labelText: labelText,
        labelStyle:
            GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      );
}
