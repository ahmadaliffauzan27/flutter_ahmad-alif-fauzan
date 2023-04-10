import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soal_api/shared/theme.dart';
import 'apis/api.dart';

class SoalPrioritas2 extends StatefulWidget {
  const SoalPrioritas2({super.key});

  @override
  State<SoalPrioritas2> createState() => _SoalPrioritas2State();
}

class _SoalPrioritas2State extends State<SoalPrioritas2> {
  @override
  String result = '';
  String name = '';
  String email = '';
  String phone = '';

  var _nameController = TextEditingController();
  var _nomorController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var data;

  final service = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal Prioritas 2',
          style: titleFont,
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: titleFont.copyWith(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Try DiceBear API',
                          style: subtitleName,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      onPressed: () async {
                        //get data (panggil class Scervies)
                        final service = Services();
                        final _result = await service.getImage();
                        result = _result.toString();

                        setState(() {});
                      },
                      child: Text(
                        'TRY',
                        style: subtitleName,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //data Response
                    result != ""
                        ? SizedBox(
                            height: 200,
                            width: 200,
                            child: SvgPicture.string(
                              result,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text(
                              "Belum ada gambar",
                              style: subtitleName,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
