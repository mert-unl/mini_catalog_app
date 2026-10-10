import 'dart:convert';
import 'dart:io';

import 'product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final client = HttpClient();

    try {
      final request = await client.getUrl(
        Uri.parse('https://wantapi.com/products.php'),
      );

      final response = await request.close();

      if (response.statusCode != 200) {
        throw Exception('Products did not load.');
      }

      final responseBody = await response.transform(utf8.decoder).join();

      final jsonData = jsonDecode(responseBody);
      final List<dynamic> productList = jsonData['data'];

      return productList
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();
    } finally {
      client.close();
    }
  }
}
