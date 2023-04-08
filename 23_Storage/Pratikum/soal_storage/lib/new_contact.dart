import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_storage/login_page.dart';
import 'package:soal_storage/model/db_manager.dart';
import 'package:soal_storage/theme.dart';
import 'input_decoration.dart';
import 'model/contact_model.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class CreateNewContact extends StatefulWidget {
  final Contact? contact;
  const CreateNewContact({Key? key, this.contact}) : super(key: key);

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences logindata;
  var indexName = 0;
  int idRandom = 0;
  // var rng = Random();
  // for (var i = 0; i < 10; i++) {
  //   print(rng.nextInt(100));
  // }

  var rng = new Random();
  // var l = List.generate(12, (_) => rng.nextInt(100));

  String username = '';
  String name = '';
  String number = '';

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  void generateId() {
    idRandom++;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initial();
    generateId();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
    });
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kontak Berhasil Ditambahkan!'),
          backgroundColor: Colors.green,
        ),
      );
      final contactToAdd = Contact(
        id: idRandom,
        name: _nameController.text,
        number: _numberController.text,
      );
      Provider.of<DbManager>(context, listen: false).addContact(contactToAdd);

      _nameController.clear();
      _numberController.clear();

      generateId();
    }
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Nama Tidak Boleh Kosong";
    } else if (name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
        name.contains(RegExp(r'[0-9]'))) {
      return "Nama Harus Alphabet";
    } else if (!isUppercase(name[0])) {
      return "Nama Harus Menggunakan Huruf Kapital";
    } else if (name.split(' ').length < 2) {
      return "Nama Harus Terdiri dari 2 Kata";
    } else {
      return null;
    }
  }

  bool isUppercase(String str) {
    return str == str.toUpperCase();
  }

  bool _isUpdate = false;

  /// Validasi nomor telepon
  String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Nomor Telepon Tidak Boleh Kosong";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
      return 'Nomor hanya bisa diisi angka';
    } else if (phone.length < 8 || phone.length > 15) {
      return "Nomor Telepon Harus 8-15 Digit";
    } else if (phone[0] != '0') {
      return "Nomor Telepon Harus Dimulai Dengan Angka 0";
    } else {
      return null;
    }
  }

  List<Contact> contactList = [];

  void _showEditDialog(Contact contact) async {
    TextEditingController nameController =
        TextEditingController(text: contact.name);
    TextEditingController numberController =
        TextEditingController(text: contact.number);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: buttonColor)),
        title: Text('Edit Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onChanged: (value) {
                name = value;
              },
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                number = value;
              },
              controller: numberController,
              decoration: InputDecoration(
                hintText: 'Number',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              nameController.dispose();
              numberController.dispose();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: buttonColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: buttonColor),
            onPressed: () {
              final updatedContact = Contact(
                id: contact.id,
                name: name,
                number: number,
              );
              // if (widget.contact != null) {
              //   _nameController.text = widget.contact!.name;
              //   _isUpdate = true;
              // }
              // if (!_isUpdate) {
              //   final ctc = Contact(
              //     name: _nameController.text,
              //     number: _numberController.text,
              //   );
              //   Provider.of<DbManager>(context, listen: false)
              //       .addContact(contact);
              // } else {
              //   final task = Contact(
              //     id: widget.contact!.id,
              //     name: _nameController.text,
              //     number: _numberController.text,
              //   );
              Provider.of<DbManager>(context, listen: false)
                  .updateContact(contact.id!, updatedContact);

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Kontak Berhasil Diedit'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Contacts',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      title: Text(
                        'Apakah Anda Yakin Ingin Keluar ?',
                        style: titleFont.copyWith(
                            color: Colors.black, fontSize: 14),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Tidak',
                            style: subtitleName.copyWith(color: primaryColor),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryColor),
                          ),
                          onPressed: () {
                            logindata.setBool('login', true);
                            logindata.remove('username');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Berhasil Logout!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          child: Text(
                            'Ya',
                            style: subtitleName.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.logout),
            )
          ],
        ),
        backgroundColor: buttonColor,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
          ),
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    'Hello $username',
                    style: titleFont,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/icon.png',
                width: 17.2,
                height: 22,
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: const [
                  Text(
                    'Punya Kontak Baru?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 50,
              width: 400,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // Form
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _nameController..text = name.toString(),
                          validator: validateName,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Name',
                            filled: true,
                            fillColor: fillColorForm,
                            hintText: "e.g Ahmad Alif Fauzan",
                            hintStyle: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _numberController
                            ..text = number.toString(),
                          validator: validatePhone,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Nomor',
                            hintText: '08xx',
                            filled: true,
                            fillColor: fillColorForm,
                            hintStyle: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(
                    width: 94,
                    child: ElevatedButton(
                      onPressed: () {
                        _saveContact();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Simpan',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),

            Consumer<DbManager>(builder: (context, manager, child) {
              final contactModel = manager.contacts;

              if (manager.contacts.isNotEmpty) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: contactModel.length,
                    // itemCount: manager.contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = manager.contacts[index];
                      final color = circleAvatar;
                      // final item = manager.contacts;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: color,
                          child: Text(
                            contact.name.substring(0, 1),
                            style: TextStyle(
                              color: buttonColor,
                            ),
                          ),
                        ),
                        title: Text(contact.name),
                        subtitle: Text(contact.number),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                color: buttonColor,
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side:
                                                BorderSide(color: buttonColor)),
                                        title: const Text('Konfirmasi'),
                                        content: const Text(
                                            'Apakah Anda ingin mengedit kontak ini?'),
                                        actions: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: buttonColor),
                                            child: const Text('Tidak'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: buttonColor),
                                            child: const Text('Ya'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _showEditDialog(contact);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                color: buttonColor,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side:
                                                BorderSide(color: buttonColor)),
                                        title: const Text('Konfirmasi'),
                                        content: const Text(
                                            'Apakah Anda yakin ingin menghapus kontak ini?'),
                                        actions: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: buttonColor),
                                            child: const Text('Tidak'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: buttonColor),
                                            child: const Text('Ya'),
                                            onPressed: () {
                                              final contactToDelete = Contact(
                                                  id: contact.id,
                                                  name: contact.name,
                                                  number: contact.number);
                                              Provider.of<DbManager>(context,
                                                      listen: false)
                                                  .deleteContact(contact.id!,
                                                      contactToDelete);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Kontak Berhasil Dihapus!'),
                                                  backgroundColor: Colors.green,
                                                ),
                                              );
                                              Navigator.pop(context);
                                              // log(index.toString());
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                })
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                    child: const Text('Belum ada kontak yang ditambahkan :('));
              }
            }),
          ]),
    );
  }
}
