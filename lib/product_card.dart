import 'package:flutter/material.dart';

import 'product.dart';
import 'cart.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final Cart cart;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.cart,
  });

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
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    cart.add(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product added to your cart!'),
                      ),
                    );
                  },
                  label: const Text('Add to My Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
