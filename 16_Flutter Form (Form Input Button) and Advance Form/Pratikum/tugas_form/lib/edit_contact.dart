import 'package:flutter/material.dart';
import 'new_contact.dart';
import 'edit_contact.dart';

class ContactList extends StatefulWidget {
  final List<Contact> contacts;

  const ContactList({required this.contacts, Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  void _saveContactChanges(Contact contact) {
    // mencari index dari kontak yang diubah
    final index = widget.contacts.indexWhere((c) => c == contact);
    if (index != -1) {
      // jika index ditemukan, lakukan update pada daftar kontak
      setState(() {
        widget.contacts[index] = contact;
      });
      Navigator.pop(context, contact);
    }
  }

  void _showEditDialog(Contact contact) async {
    TextEditingController nameController =
        TextEditingController(text: contact.name);
    TextEditingController numberController =
        TextEditingController(text: contact.number);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: 'Number',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              nameController.dispose();
              numberController.dispose();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                contact.name = nameController.text;
                contact.number = numberController.text;
              });
              _saveContactChanges(contact);
              // Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Contact'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: ListView.builder(
          itemCount: widget.contacts.length,
          itemBuilder: (context, index) {
            Contact contact = widget.contacts[index];

            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.number),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showEditDialog(contact);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
