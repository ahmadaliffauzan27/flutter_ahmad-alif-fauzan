import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact.dart';
import '../provider/contact_provider.dart';
import '../shared/theme.dart';

class EditContactPage extends StatefulWidget {
  final Contact contact;

  EditContactPage({required this.contact});

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _phoneNumber;

  @override
  void initState() {
    super.initState();
    _name = widget.contact.name;
    _phoneNumber = widget.contact.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Contact',
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
                initialValue: _name,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Number',
                style: subtitleName,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: _phoneNumber,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    appState.editContact(widget.contact, _name, _phoneNumber);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Kontak Berhasil Diedit'),
                      backgroundColor: Colors.green,
                    ));
                  }
                },
                child: Text(
                  'Edit',
                  style: subtitleName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
