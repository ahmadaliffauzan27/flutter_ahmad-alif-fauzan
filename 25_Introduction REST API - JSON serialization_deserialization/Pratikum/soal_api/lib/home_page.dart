import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soal_api/shared/theme.dart';
import 'package:soal_api/soal_eksplorasi.dart';
import 'package:soal_api/soal_prioritas1.dart';
import 'package:soal_api/soal_prioritas2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tugas API',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Soal Prioritas 1',
                        style: subtitleName,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SoalPrioritas1()),
                    );
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Soal Prioritas 2',
                        style: subtitleName,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SoalPrioritas2()),
                    );
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Soal Eksplorasi',
                        style: subtitleName,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SoalEksplorasi()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
