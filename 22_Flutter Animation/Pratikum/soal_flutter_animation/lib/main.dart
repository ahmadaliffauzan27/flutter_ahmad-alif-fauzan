import 'package:flutter/material.dart';
import 'package:soal_flutter_animation/provider/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:soal_flutter_animation/widget/contacts_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(),
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
