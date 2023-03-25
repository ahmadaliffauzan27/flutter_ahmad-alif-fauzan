import 'package:flutter/material.dart';
import 'create_contact_page.dart';
import 'theme.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: secondaryColor,
              child: Text(
                _contacts[index].name[0],
                style: TextStyle(color: primaryColor),
              ),
            ),
            title: Text(
              _contacts[index].name,
              style: titleName,
            ),
            subtitle: Text(
              _contacts[index].phoneNumber,
              style: subtitleName,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/create').then((contact) {
            if (contact != null) {
              setState(() {
                _contacts.add(contact as Contact);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
