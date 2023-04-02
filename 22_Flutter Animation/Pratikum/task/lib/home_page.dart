import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Materi Alta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBig = !isBig;
                });
              },
              child: const Text(
                'Resize Gambar',
              ),
            ),
            AnimatedContainer(
              height: isBig ? 200 : 100,
              width: isBig ? 200 : 100,
              duration: const Duration(milliseconds: 500),
              child: Image.network(
                'https://images.pexels.com/photos/8920380/pexels-photo-8920380.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
