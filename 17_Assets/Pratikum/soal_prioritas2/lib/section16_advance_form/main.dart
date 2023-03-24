import 'package:flutter/material.dart';
import 'package:task_gridview/theme.dart';
import 'new_contact.dart';

void main() {
  runApp(const HomeFormAdvance());
}

class HomeFormAdvance extends StatelessWidget {
  const HomeFormAdvance({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Contact'),
        backgroundColor: primaryColor,
      ),
      body: const CreateNewContact(),
    );
  }
}
