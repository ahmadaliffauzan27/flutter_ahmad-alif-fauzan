import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: const Text('MaterialApp'),
          backgroundColor: Colors.grey[800],
        ),

  drawer: Drawer(
    backgroundColor: Colors.grey[850],
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white
              ),),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white
              )),
          ),
        ],
      ),
    ),
  ),
  body: const MyStatefulWidget()
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
    Text(
      'Ini Halaman Home',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    Text(
      'Ini Halaman Setting',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.tealAccent[400],
        onTap: _onItemTapped,
      ),
    );
  }
}


