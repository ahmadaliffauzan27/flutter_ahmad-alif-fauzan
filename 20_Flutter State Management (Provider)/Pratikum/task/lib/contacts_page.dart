import 'package:flutter/material.dart';
import 'package:task/app_state.dart';
import 'package:task/contact.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/create');
        //     },
        //   ),
        // ],
      ),
      body: Builder(builder: (context) {
        if (appState.contacts.isEmpty) {
          return Center(
            child: Text(
              'Belum ada kontak yang ditambahkan',
              style: subtitleName,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: appState.contacts.length,
            itemBuilder: (context, index) {
              final contact = appState.contacts[index];
              return ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: Text(
                    contact.name[0],
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                title: Text(contact.name),
                subtitle: Text(contact.phoneNumber),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
