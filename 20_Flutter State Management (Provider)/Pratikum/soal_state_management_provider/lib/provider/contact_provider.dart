import 'package:flutter/material.dart';

import '../flutter_contact/contact.dart';

class ContactProvider with ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
