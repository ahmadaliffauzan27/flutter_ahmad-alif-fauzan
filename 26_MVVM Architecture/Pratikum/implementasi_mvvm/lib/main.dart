import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_storage/view_model/db_manager.dart';
import 'package:soal_storage/view/login_page.dart';
import 'view/new_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LoginPage(),
          '/contact': (context) => const CreateNewContact(),
        },
      ),
    );
  }
}
