import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:soal_task_manajemen_bloc/bloc/contact_bloc.dart';
import 'package:soal_task_manajemen_bloc/contact_form/contact_page.dart';
import 'package:soal_task_manajemen_bloc/flutter_gallery/gallery_page.dart';
import 'package:soal_task_manajemen_bloc/home_page.dart';
import 'package:soal_task_manajemen_bloc/provider/image_provider.dart';

void main() {
  runApp(const HomeForm());
}

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<ImgProvider>(
          create: (_) => ImgProvider(),
        ),
        BlocProvider(
          create: (context) => ContactBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Form',
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/gallery': (context) => GalleryPage(),
          '/contact': (context) => ContactPage(),
        },
      ),
    );
  }
}
