import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soal_api/apis/api.dart';
import 'package:soal_api/shared/theme.dart';

class SoalPrioritas1 extends StatefulWidget {
  const SoalPrioritas1({super.key});

  @override
  State<SoalPrioritas1> createState() => _SoalPrioritas1State();
}

class _SoalPrioritas1State extends State<SoalPrioritas1> {
  String? result;
  String name = '';
  String number = '';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal Prioritas 1',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: titleFont.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Try Dio package',
                    style: subtitleName,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Name',
                    style: subtitleName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: 'Input name',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Phone',
                    style: subtitleName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numberController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: 'Input phone number',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () async {
                              final service = Services();

                              final _result = await service.createUser(
                                  name: _nameController.text,
                                  phone: _numberController.text);
                              result = _result.toString();

                              setState(() {});

                              // _nameController.clear();
                              // _numberController.clear();
                            },
                            child: Text(
                              'POST',
                              style: subtitleName,
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () async {
                              final service = Services();

                              final _result = await service.readUser();
                              result = _result.toString();

                              setState(() {});
                            },
                            child: Text(
                              'FETCH',
                              style: subtitleName,
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () async {
                              final service = Services();

                              final _result = await service.update(
                                  name: _nameController.text,
                                  phone: _numberController.text);
                              result = _result.toString();

                              setState(() {});
                            },
                            child: Text(
                              'PUT',
                              style: subtitleName,
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () async {
                              await Services().deleteUser(
                                  1); // ubah id sesuai dengan id data yang ingin dihapus
                              setState(
                                  () {}); // setelah data dihapus, tampilan perlu diperbarui
                            },
                            child: Text(
                              'DELETE',
                              style: subtitleName,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      result ?? "".toString(),
                      style: TextStyle(color: textColor1),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
