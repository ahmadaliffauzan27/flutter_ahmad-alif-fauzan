import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soal_eksplorasi/theme.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        'Ini Halaman Information',
        style: blackFontStyle.copyWith(
          fontSize: 16,
        ),
      ),
      );
  }
}