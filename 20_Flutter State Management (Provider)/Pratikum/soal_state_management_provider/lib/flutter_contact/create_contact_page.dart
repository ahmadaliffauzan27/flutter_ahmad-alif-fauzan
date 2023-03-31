import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/contact_provider.dart';
import '../theme.dart';
import 'contact.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({super.key});

  @override
  _CreateContactPageState createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Contact',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  // enabledBorder: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  labelText: 'e.g Ahmad Alif Fauzan',
                  labelStyle: subtitleName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please input a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Number',
                style: subtitleName,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  // enabledBorder: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  labelText: 'e.g 089660302589',
                  labelStyle: subtitleName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please input phone number';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please input a valid number';
                  } else if (value[0] != '0') {
                    return 'Number must start with 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor)),
                child: const Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newContact = Contact(_name!, _phoneNumber!);
                    Provider.of<ContactProvider>(context, listen: false)
                        .addContact(newContact);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Kontak Berhasil Ditambahkan'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
