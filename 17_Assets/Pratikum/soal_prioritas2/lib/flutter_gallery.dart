import 'package:flutter/material.dart';
import 'theme.dart';

class FlutterGallery extends StatelessWidget {
  final List<String> images = [
    'https://images.pexels.com/photos/8920380/pexels-photo-8920380.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/15917105/pexels-photo-15917105.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
    'https://images.pexels.com/photos/4051642/pexels-photo-4051642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/11172081/pexels-photo-11172081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/15780778/pexels-photo-15780778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/10800492/pexels-photo-10800492.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/15655688/pexels-photo-15655688.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/10603697/pexels-photo-10603697.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];

  @override
  Widget build(BuildContext context) {
    // final String gallery = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Wrap(spacing: 10, children: [
          Text(
            'Flutter Gallery 2',
            style: titleFont,
          ),
          const Icon(Icons.photo_library),
        ]),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            // runSpacing: 5,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.touch_app,
                                color: primaryColor,
                                size: 17,
                              ),
                              Text(
                                'Klik untuk melihat foto secara penuh',
                                style: subtitleFont,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    title: Text(
                                      'Tampilkan detail foto ini?',
                                      style: titleFont.copyWith(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    content: SizedBox(
                                      height: 220,
                                      width: 200,
                                      child: Image.network(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Tidak',
                                          style: subtitleFont.copyWith(
                                              color: primaryColor),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  primaryColor),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushNamed(
                                              context, '/detail',
                                              arguments: images[index]);
                                        },
                                        child: Text(
                                          'Ya',
                                          style: subtitleFont.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              height: 300,
                              width: 300,
                              child: Image.network(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
