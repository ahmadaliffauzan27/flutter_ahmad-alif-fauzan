import 'package:flutter/material.dart';
import 'package:task_gridview/theme.dart';
import 'contacts_page.dart';
import 'create_contact_page.dart';

void main() => runApp(Section19());

class Section19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/create': (context) => CreateContactPage(),
      },
      home: Scaffold(
        body: ContactsPage(),
      ),
    );
  }
}
