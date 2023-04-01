import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_state_manajement_bloc/theme.dart';

import 'bloc/contact_bloc.dart';
import 'bloc/contact_event.dart';
import 'bloc/contact_state.dart';
import 'model/contact_model.dart';

class CreateContactPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nama',
                style: subtitleName,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
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
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Nomor',
                style: subtitleName,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  // enabledBorder: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  labelText: '08xx',
                  labelStyle: subtitleName,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please input number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final String name = _nameController.text;
                        final String phoneNumber = _phoneNumberController.text;
                        final Contact contact = Contact(name, phoneNumber);

                        BlocProvider.of<ContactBloc>(context)
                            .add(AddContact(contact));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Save',
                      style: subtitleName,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
