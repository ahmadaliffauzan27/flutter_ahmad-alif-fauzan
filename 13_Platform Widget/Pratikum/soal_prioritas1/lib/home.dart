import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:section13/list_data.dart';

class HalamanHome extends StatelessWidget {
  const HalamanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ProfileData());
    // return const SafeArea(
    //   child: Center(
    //     child: Text(
    //       'Ini Halaman Home',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 16,
    //         fontWeight: FontWeight.w500
    //       ),
    //       ),
    //   )
      // );
  }
}