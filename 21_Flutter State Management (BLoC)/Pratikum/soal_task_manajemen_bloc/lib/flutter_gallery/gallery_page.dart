import 'package:flutter/material.dart';
import '../provider/image_provider.dart';
import '../theme.dart';
import 'detail_image.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imgProvider = Provider.of<ImgProvider>(context);
    final images = imgProvider.getImages();

    return Scaffold(
        appBar: AppBar(
          title: Wrap(
            spacing: 10,
            children: [
              Text(
                'Flutter Gallery',
                style: titleFont,
              ),
              Icon(Icons.photo_library)
            ],
          ),
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
                                  style: subtitleName,
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
                                            style: subtitleName.copyWith(
                                                color: primaryColor),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(primaryColor),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                        imageUrl:
                                                            images[index]),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Ya',
                                            style: subtitleName.copyWith(
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
        ));
  }
}
