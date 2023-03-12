import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soal_eksplorasi/theme.dart';
import 'package:supercharged/supercharged.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(1),
        children: [ 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn Flutter',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn ReactJS',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn VueJS',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn Tailwind CSS',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn UI/UX',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn Figma',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn Digital Marketing',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn Machine Learning',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn Laravel',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
             height: 70,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                )
              )
             ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Learn PHP Native',
                  style: blackFontStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],

        ),
      ]),
    );
  }
}