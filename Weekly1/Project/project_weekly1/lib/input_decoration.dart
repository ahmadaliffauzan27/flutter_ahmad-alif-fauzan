import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_weekly1/theme.dart';

class InputDecorationStyle {
  static inputDecorationStyle(String labelText) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      labelText: labelText,
      labelStyle: label.copyWith(color: Colors.grey),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1))
      // enabledBorder: InputBorder.none,
      // focusedBorder: InputBorder.none,
      );
}
