import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Color.fromARGB(255, 36, 33, 33),
          activeColor: CupertinoColors.white,
          inactiveColor: CupertinoColors.darkBackgroundGray,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Setting',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: const CupertinoNavigationBar(
                  middle: Text(
                    'CupertinoApp',
                    style: TextStyle(
                      color: CupertinoColors.white,
                    ),),
                  backgroundColor: Color.fromARGB(255, 36, 33, 33),
                ),
                backgroundColor: CupertinoColors.black,
                child: Center(
                  child: Text(
                    'Content of tab $index',
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
