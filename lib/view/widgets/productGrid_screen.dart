import 'package:flutter/material.dart';
import 'package:watch_app/models/products.dart';
import 'package:watch_app/view/widgets/productCard_screen.dart';
import 'package:watch_app/view/widgets/productDetail_screen.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ), // SliverGridDelegateWithFixedCrossAxisCount
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
             MaterialPageRoute(builder: (context)=> ProductDetailScreen(
              product: product,
             ))),
          child: ProductCard(product: product),
        ); // GestureDetector
      },
    ); // GridView.builder

  }
}