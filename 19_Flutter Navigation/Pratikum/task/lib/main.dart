import 'package:flutter/material.dart';
import 'contacts_page.dart';
import 'create_contact_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsPage(),
      routes: {
        '/create': (context) => CreateContactPage(),
      },
    );
  }
}
