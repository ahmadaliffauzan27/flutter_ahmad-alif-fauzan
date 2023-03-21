import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_prioritas1/edit_contact.dart';
import 'package:soal_prioritas1/theme.dart';
import 'package:supercharged/supercharged.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'input_decoration.dart';

class Contact {
  String name;
  String number;

  Contact(this.name, this.number);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({Key? key}) : super(key: key);

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  void dispose1() {
    _nameController.dispose();
  }

  void dispose2() {
    _numberController.dispose();
  }

  bool isUppercase(String str) {
    return str == str.toUpperCase();
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
        title: Text('Edit Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
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
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                contact.name = nameController.text;
                contact.number = numberController.text;
              });

              Navigator.of(context).pop();
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
        title: Text(
          'Contacts',
          style: GoogleFonts.roboto(
            fontSize: 20,
          ),
        ),
        backgroundColor: buttonColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 160,
            width: 398,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'assets/icon.png',
                  width: 17.2,
                  height: 22,
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Create New Contacts',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                      style: GoogleFonts.roboto(
                        color: textColor1,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
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
          Container(
            height: 95,
            width: 397,
            decoration: BoxDecoration(
              color: fillColorForm,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.7,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Name'),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecorationStyle.inputDecorationStyle(
                            'Input your name',
                          ).copyWith(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your name';
                            }
                            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                              return 'Name cannot contain numbers or special characters';
                            } else {
                              List<String> words = value.trim().split(" ");
                              for (int i = 0; i < words.length; i++) {
                                words[i] = words[i].toLowerCase().capitalize();
                                if (words[i][0] !=
                                    value.trim().split(" ")[i][0]) {
                                  return 'Each word must start with a capital letter';
                                }
                              }

                              if (words.length <= 1) {
                                return 'At least two words are required';
                              }
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 95,
            width: 397,
            decoration: BoxDecoration(
              color: fillColorForm,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Number'),
                        TextFormField(
                          controller: _numberController,
                          decoration: InputDecorationStyle.inputDecorationStyle(
                            'Input your number',
                          ).copyWith(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your number';
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Please input a valid number';
                            } else if (value[0] != '0') {
                              return 'Number must start with 0';
                            } else if (value.length <= 8 &&
                                value.length <= 15) {
                              return 'Please input minimum 8 - 15 number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: 94,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey1.currentState!.validate() &&
                        _formKey2.currentState!.validate()) {
                      String name = _nameController.text;
                      String number = _numberController.text;
                      Contact newContact = Contact(name, number);
                      setState(() {
                        contactList.add(Contact(name, number));
                      });

                      _nameController.clear();
                      _numberController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Data Berhasil Disimpan')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 49,
          ),
          Center(
            child: Text(
              'List Contact',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          LiquidPullToRefresh(
            onRefresh: () async {},
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  final contact = contactList[index];
                  final color = circleAvatar;
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
                          onPressed: () async {
                            // final updatedContact = await Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         ContactList(contacts: contactList),
                            //   ),
                            // );
                            _showEditDialog(contact);
                            // if (updatedContact != null) {
                            //   setState(() {
                            //     final index = contactList.indexOf(contact);
                            //     contactList[index] = updatedContact;
                            //   });
                            // }
                          },
                        ),
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi'),
                                    content: const Text(
                                        'Apakah Anda yakin ingin menghapus kontak ini?'),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Tidak'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text('Ya'),
                                        onPressed: () {
                                          setState(() {
                                            contactList.removeAt(index);
                                          });
                                          Navigator.pop(context);
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
                }),
          ),
        ],
      ),
    );
  }
}
