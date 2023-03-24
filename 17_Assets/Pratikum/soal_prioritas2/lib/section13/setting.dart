import 'package:flutter/material.dart';

class HalamanSetting extends StatelessWidget {
  const HalamanSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
      child: Text(
        'Ini Halaman Setting',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ));
  }
}
