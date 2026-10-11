import 'package:flutter/material.dart';

import 'product.dart';
import 'products_service.dart';
import 'product_card.dart';
import 'cart.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Cart();

    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 223, 183, 6),
        ),
        useMaterial3: true,
      ),
      home: HomePage(cart: cart),
    );
  }
}

class HomePage extends StatefulWidget {
  final Cart cart;

  const HomePage({super.key, required this.cart});

  @override
  State<HomePage> createState() => _HomePageState();
}

String searchQuery = '';

class _HomePageState extends State<HomePage> {
  final ProductService productService = ProductService();

  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = productService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        title: const Text(
          'Mert Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: widget.cart),
                ),
              );
            },

            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 243, 243, 243),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://wantapi.com/assets/banner.png',
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Discover Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              FutureBuilder<List<Product>>(
                future: productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final allProducts = snapshot.data ?? [];
                  final products = allProducts.where((product) {
                    return product.name.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    );
                  }).toList();

                  if (products.isEmpty) {
                    return const Center(child: Text('No products found yet.'));
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 12,
                        ),

                    itemBuilder: (context, index) {
                      final product = products[index];

                      return Card(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(1),
                        color: Color.fromARGB(242, 255, 255, 255),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                  product: product,
                                  cart: widget.cart,
                                ),
                              ),
                            );
                          },

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,

                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      Text(
                                        product.tagline,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            121,
                                            120,
                                            120,
                                          ),
                                          fontSize: 12,
                                        ),
                                      ),

                                      Text(
                                        product.price,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,

                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            240,
                                            145,
                                            2,
                                          ),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
