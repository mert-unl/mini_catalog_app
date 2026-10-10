import 'package:flutter/material.dart';

import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),

              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(product.tagline, style: const TextStyle(fontSize: 16)),

              Text(
                product.price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 223, 153, 2),
                ),
              ),

              const Text(
                'Product Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              
              Text(product.description, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
