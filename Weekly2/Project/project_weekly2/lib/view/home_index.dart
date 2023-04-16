import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_weekly2/view/product_card.dart';

import 'package:project_weekly2/view/style/theme.dart';

import 'list_product.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'About Us',
                style: blackFontStyle2.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Halo! Nama saya Ahmad Alif Fauzan, saya berasal dari kelas Flutter B, ini adalah tugas Weekly 2 saya.',
                    style: blackFontStyle2.copyWith(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Selamat datang di zstore',
                style: blackFontStyle2.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                  items: [
                    'https://pbs.twimg.com/media/EhSMJnmUYAAAX5r.jpg',
                    'https://pbs.twimg.com/media/Fq6fQPlacAAl5EI?format=jpg&name=900x900',
                    'https://awsimages.detik.net.id/community/media/visual/2020/03/25/902419c2-817f-4354-bab3-f47b4f13d26e.jpeg?w=700&q=90',
                  ].map((item) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk',
                    style:
                        blackFontStyle2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More product >',
                    style: blackFontStyle2,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
