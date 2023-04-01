import 'package:flutter/material.dart';
import 'theme.dart';

class HomePage extends StatelessWidget {
  final List<String> section = [
    'Flutter Gallery',
    'Contact App\nMenggunakan BloC',
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
                    Navigator.pushNamed(context, '/gallery',
                        arguments: section[index]);
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/contact',
                        arguments: section[index]);
                    break;
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  section[index],
                  style: subtitleName.copyWith(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
