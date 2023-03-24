import 'package:flutter/material.dart';
import 'list_data.dart';
import 'setting.dart';

class HomeSection13 extends StatefulWidget {
  const HomeSection13({super.key});

  @override
  State<HomeSection13> createState() => _HomeSection13State();
}

class _HomeSection13State extends State<HomeSection13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text(
            'Home Page',
          ),
        ),
        // drawer: Drawer(
        //   backgroundColor: Colors.grey[850],
        //   child: ListView(
        //     children: [
        //       const ListTile(
        //         title: Text(
        //           'Home',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       ListTile(
        //         title: const Text(
        //           'Setting',
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const HalamanSetting()),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: const MyStatefulWidget());
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
    ProfileData(),
    HalamanSetting(),
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
