import 'package:flutter/material.dart';
import 'package:task/contact.dart';

class AppState with ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
