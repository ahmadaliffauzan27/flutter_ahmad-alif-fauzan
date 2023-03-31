import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_gridview/flutter_contact/contacts_page.dart';
import 'package:task_gridview/home_page.dart';
import 'package:task_gridview/provider/contact_provider.dart';
import 'package:task_gridview/provider/image_provider.dart';
import 'theme.dart';
import 'flutter_gallery/gallery_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImgProvider>(
          create: (_) => ImgProvider(),
        ),
        ChangeNotifierProvider<ContactProvider>(
          create: (_) => ContactProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Gallery',
        theme: ThemeData(primaryColor: primaryColor),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/gallery': (context) => GalleryPage(),
          '/contact': (context) =>
              const ContactsPage(), // Add ContactPage to routes
        },
      ),
    );
  }
}
