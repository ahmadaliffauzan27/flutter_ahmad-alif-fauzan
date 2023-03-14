import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(
                    'CupertinoApp',
                    style: TextStyle(
                      color: CupertinoColors.white,
                    ),),
                  backgroundColor: CupertinoColors.darkBackgroundGray,
                ),
                backgroundColor: CupertinoColors.black,
                child: Center(
                  child: Text(
                    'Mang eak',
                    style: TextStyle(
                      color: CupertinoColors.white,
                    ),),
                ),
              ));
  }
}
