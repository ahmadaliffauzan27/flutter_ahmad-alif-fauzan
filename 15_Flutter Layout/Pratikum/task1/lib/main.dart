import 'package:flutter/material.dart';
import 'package:task1/list_data.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'JSON ListView in Flutter',
          ),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            final ListData listData = data[index];
            return ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  listData.username[0],
                  style: const TextStyle(
                    color: Colors.white
                    ),
                  ),
                ),
                title: Text(
                  listData.username,
                ),
                subtitle: Text(
                  listData.phone,
                ),
              );
          },
        )
      ),
      );
  }
}