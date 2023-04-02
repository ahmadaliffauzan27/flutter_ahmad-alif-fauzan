import 'package:flutter/material.dart';
import 'package:soal_flutter_animation/model/contact.dart';

class ContactProvider with ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(Contact contact, String name, String phoneNumber) {
    final index = _contacts.indexOf(contact);
    _contacts[index] = Contact(name, phoneNumber);
    notifyListeners();
  }

  void deleteContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }
}
