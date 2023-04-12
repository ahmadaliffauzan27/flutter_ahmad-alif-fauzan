import 'package:flutter/material.dart';

import '../model/database_helper.dart';
import '../model/contact_model.dart';

class DbManager extends ChangeNotifier {
  List<Contact> _contacts = [];
  late DatabaseHelper _dbHelper;

  List<Contact> get contacts => _contacts;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllContacts();
    notifyListeners();
  }

  void _getAllContacts() async {
    _contacts = await _dbHelper.getContact();
    notifyListeners();
  }

  Future<void> addContact(Contact contact) async {
    await _dbHelper.insertContact(contact);
    _getAllContacts();
    notifyListeners();
  }

  Future<Contact> getContactById(String id) async {
    return await _dbHelper.getContactById(id);
  }

  void updateContact(int id, Contact contact) async {
    await _dbHelper.updateContact(id, contact);
    _getAllContacts();
    notifyListeners();
  }

  void deleteContact(int id, Contact contact) async {
    await _dbHelper.deleteContact(id, contact);
    _getAllContacts();
    notifyListeners();
  }

  vFuture<ContactModel>(String id, ContactModel contactModel) async {
    return await _dbHelper.getContactById(id);

    _getAllContacts();
    notifyListeners();
  }
}
