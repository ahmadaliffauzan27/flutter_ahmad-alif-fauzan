import 'package:flutter/material.dart';
import 'package:task/contact.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
