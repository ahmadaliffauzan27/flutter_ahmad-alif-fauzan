import 'package:flutter/material.dart';
import 'theme.dart';

class CreateContactPage extends StatefulWidget {
  @override
  _CreateContactPageState createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _phoneNumber;

  @override
  void initState() {
    _name = '';
    _phoneNumber = '';
    super.initState();
  }

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
                  labelText: 'Input your name',
                  labelStyle: subtitleName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
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
                    return 'Please enter a phone number';
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
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor)),
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, Contact(_name!, _phoneNumber!));
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

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}
