import 'package:flutter/material.dart';

import 'cart.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final totalPrice = cart.items.fold<double>(0, (total, product) {
      final price =
          double.tryParse(product.price.replaceAll('\$', '').trim()) ?? 0;
      return total + price;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Column(
        children: [
          // Product list
          Expanded(
            child: cart.items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 120,
                          color: Colors.grey,
                        ),

                        const Text(
                          'Your cart is empty.',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final product = cart.items[index];

                      return Card(
                        color: const Color.fromARGB(255, 253, 242, 221),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 255, 156, 8),
                          ),
                        ),
                        child: ListTile(
                          leading: Image.network(
                            product.imageUrl,
                            width: 100,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.name),

                          subtitle: Text(product.price),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              cart.items.removeAt(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Fixed bottom section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 255, 213, 134),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: cart.items.isEmpty
                          ? null
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Purchase feature is not implemented yet.',
                                  ),
                                ),
                              );
                            },
                      icon: const Icon(Icons.shopping_bag_outlined),
                      label: const Text('Purchase'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
