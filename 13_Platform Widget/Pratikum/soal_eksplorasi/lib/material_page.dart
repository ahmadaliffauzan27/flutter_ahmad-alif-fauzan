import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:soal_eksplorasi/favorites.dart';
import 'package:soal_eksplorasi/search.dart';
import 'package:soal_eksplorasi/information.dart';
import 'package:soal_eksplorasi/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  String searchValue = '';
  final List<String> _suggestions = [
    'Afeganistan', 
    'Albania', 
    'Algeria', 
    'Australia', 
    'Brazil', 
    'German', 
    'Madagascar', 
    'Mozambique', 
    'Portugal', 
    'Zambia'];
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        appBar: EasySearchBar(
          foregroundColor: Colors.white,
          title: Center(
            child: Text(
              'My Flutter App',
              style:whiteFontStyle,
            ),
          ),
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: _suggestions,
        ),
      body: Stack(
      children: [
        const MyStatefulWidget(),
        Positioned(
          right: 16,
              bottom: 70,
              child: FloatingActionButton(
              foregroundColor: Colors.black,
              backgroundColor: secondaryColor,
              onPressed: () {
              },
              tooltip: 'Increment',
          child: const Icon(Icons.add)),
          ),
      ],
      )
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Favorites(),
    Search(),
    Information(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}