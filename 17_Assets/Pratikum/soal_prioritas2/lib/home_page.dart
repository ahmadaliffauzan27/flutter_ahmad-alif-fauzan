import 'package:flutter/material.dart';
import 'theme.dart';

class HomePage extends StatelessWidget {
  final List<String> section = [
    'Tugas Section 12',
    'Tugas Section 13',
    'Tugas Section 15',
    'Tugas Section 16 \n Form Input',
    'Tugas Section 16 \n Advance Form',
    'Tugas Section 17',
    'Code Competence\nWeekly 1',
    'Tugas Section 19',
    // 'Tugas Section 18',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(spacing: 10, children: [
          Text(
            'Daftar Tugas',
            style: titleFont,
          ),
          const Icon(Icons.photo_library),
        ]),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: section.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, '/section12',
                        arguments: section[index]);
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/section13',
                        arguments: section[index]);
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/section15',
                        arguments: section[index]);
                    break;
                  case 3:
                    Navigator.pushNamed(context, '/section16',
                        arguments: section[index]);
                    break;
                  case 4:
                    Navigator.pushNamed(context, '/section16_2',
                        arguments: section[index]);
                    break;
                  case 5:
                    Navigator.pushNamed(context, '/gallery',
                        arguments: section[index]);
                    break;
                  case 6:
                    Navigator.pushNamed(context, '/weekly1',
                        arguments: section[index]);
                    break;
                  case 7:
                    Navigator.pushNamed(context, '/section19',
                        arguments: section[index]);
                    break;

                  // tambahkan case untuk route ke halaman yang lain
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  section[index],
                  style: subtitleFont.copyWith(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
