import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soal_api/shared/theme.dart';
import 'apis/api.dart';

class SoalEksplorasi extends StatefulWidget {
  const SoalEksplorasi({super.key});

  @override
  State<SoalEksplorasi> createState() => _SoalEksplorasiState();
}

class _SoalEksplorasiState extends State<SoalEksplorasi> {
  @override
  String result = '';
  String name = '';
  String email = '';
  String phone = '';

  String initialNameImage = "";
  var _nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var data;

  final service = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inisial Gambar',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: titleFont.copyWith(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Convert Your Name to initial image.',
                  style: subtitleName,
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //data Response
                      result != ""
                          ? Container(
                              height: 200,
                              width: 200,
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                              child: SvgPicture.string(
                                result,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Center(
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 2)),
                                child: Center(
                                  child: Text(
                                    "Image Not Found",
                                    style: subtitleName,
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: subtitleName,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _nameController..text = initialNameImage,
                        onChanged: (String value) {
                          initialNameImage = value;
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          labelText: 'Input Your Name',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                  ),
                  onPressed: () async {
                    //panggil generateimage (panggil class Scervies)
                    final service = Services();
                    final _result =
                        await service.getImageInput(_nameController.text);
                    result = _result.toString();

                    _nameController.clear;
                    initialNameImage = "";

                    setState(() {});
                  },
                  child: Text(
                    'TRY',
                    style: subtitleName,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
