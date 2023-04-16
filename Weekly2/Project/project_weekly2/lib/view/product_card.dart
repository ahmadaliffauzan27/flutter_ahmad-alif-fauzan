import 'package:flutter/material.dart';
import 'package:project_weekly2/view/product_model.dart';
import 'package:project_weekly2/view/style/theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            product.imageUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: blackFontStyle2),
                const SizedBox(height: 8),
                Text(
                  'Rp. ${product.price}',
                  style: blackFontStyle3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
