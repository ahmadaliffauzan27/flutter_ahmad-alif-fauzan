import 'package:flutter/cupertino.dart';

class Carousel extends StatelessWidget {
  final List<String> images = [
    'https://i0.wp.com/www.simplytek.lk/wp-content/uploads/2021/04/xiaomi_mi_band_6-2_1.jpg?resize=600%2C600&ssl=1',
    'https://s1.bukalapak.com/img/60670955671/large/data.jpeg.webp',
    'https://bb-scm-prod-pim.oss-ap-southeast-5.aliyuncs.com/products/dac16736a7d2f9cbbad17658ab1de744/helix/01-APPLE-8DVPHAPPA-APPMPUF3ID-A-Midnight1.jpg',
  ];

  Carousel({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(images[index]),
          );
        },
      ),
    );
  }
}
