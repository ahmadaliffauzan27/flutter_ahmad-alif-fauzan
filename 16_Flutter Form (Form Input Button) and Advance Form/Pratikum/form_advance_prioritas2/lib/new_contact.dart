import 'package:file_picker/file_picker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:soal_prioritas1/theme.dart';
import 'package:supercharged/supercharged.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'input_decoration.dart';
import 'dart:io';

class Contact {
  String name;
  String number;
  String pickDate;
  int color;
  String imagePath;

  Contact(this.name, this.number, this.pickDate, this.color, this.imagePath);
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
  String _imagePath = '';
  bool showPreview = false;

  File? _image;
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = buttonColor;

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: buttonColor)),
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
            child: Text(
              'Cancel',
              style: TextStyle(color: buttonColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: buttonColor),
            onPressed: () {
              setState(() {
                contact.name = nameController.text;
                contact.number = numberController.text;
              });

              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data Berhasil Diedit'),
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
                    key: _formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Number'),
                        TextFormField(
                          controller: _numberController,
                          decoration: InputDecorationStyle.inputDecorationStyle(
                            '08xx-xxxx-xxxx',
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
                            } else if (value.length <= 8 ||
                                value.length >= 15) {
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
          Column(
            children: [
              buildDatePicker(context),
              const SizedBox(
                height: 20,
              ),
              buildColorPicker(context),
              const SizedBox(
                height: 20,
              ),
              buildFilePicker(),
              const SizedBox(
                height: 20,
              ),
            ],
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
                    // if (_formKey1.currentState!.validate() &&
                    //     _formKey2.currentState!.validate() &&
                    //     _imagePath.isEmpty) {
                    if (_formKey1 == null ||
                        _formKey2 == null ||
                        _imagePath.isEmpty ||
                        _nameController.text.isEmpty ||
                        _nameController.text.isEmpty ||
                        _dueDate == null ||
                        _currentColor == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Silakan lengkapi data'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    } else {
                      String name = _nameController.text;
                      String number = _numberController.text;
                      String pickDate =
                          DateFormat('dd-MM-yyyy').format(_dueDate);
                      int color = _currentColor.value;
                      String _imagePath = _image!.path;

                      Contact newContact =
                          Contact(name, number, pickDate, color, _imagePath);
                      setState(() {
                        contactList.add(newContact);
                        // showPreview = false;
                      });

                      print(name);
                      print(number);
                      print(pickDate);
                      print(color);
                      print(_image);

                      // if (showPreview) {
                      //   // tampilkan preview jika showPreview bernilai true
                      //   Image.file(
                      //     _image!,
                      //     width: 300,
                      //     height: 300,
                      //   );
                      // }
                      _nameController.clear();
                      _numberController.clear();
                      _image = null;
                      _currentColor = Colors.orange;
                      _dueDate = DateTime.now();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data Berhasil Disimpan'),
                          backgroundColor: Colors.green,
                        ),
                      );
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
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: contactList.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = contactList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(contact.color),
                    child: Text(
                      contact.name.substring(0, 1),
                      style: TextStyle(
                        color: buttonColor,
                      ),
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(contact.number),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(contact.pickDate),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: contact.imagePath != null
                            ? Image.file(File(contact.imagePath))
                            : Container(),
                      )
                    ],
                  ),
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
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: buttonColor)),
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
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: buttonColor)),
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
                                        setState(() {
                                          contactList.removeAt(index);
                                        });
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Data Berhasil Dihapus'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
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
        ],
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Date',
            ),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: Text(
                'Select',
                style: TextStyle(color: buttonColor),
              ),
            )
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 10,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: buttonColor)),
                      title: const Text('Pick Your Color'),
                      content: BlockPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          }),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  });
            },
            child: const Text('Pick Avatar Color'),
          ),
        )
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {
              _pickFile();
              //
            },
            child: const Text('Pick File'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _image != null
            ? Image.file(
                _image!,
                height: 200,
              )
            : Container(),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // mendapatkan file dari object result
    final file = result.files.first;

    setState(() {
      _image = File(file.path!);
      _imagePath = file.path!;
    });
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
