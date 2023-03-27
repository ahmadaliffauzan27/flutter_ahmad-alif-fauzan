import 'package:flutter/material.dart';
import 'package:task/contacts_page.dart';
import 'package:task/create_contact_page.dart';
import 'package:task/app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contacts App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ContactsPage(),
        // routes: {
        //   '/create': (context) => const CreateContactPage(),
        // },
      ),
    );
  }
}
