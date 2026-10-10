import 'product.dart';

class Cart {
  final List<Product> items = [];

  void add(Product product) {
    items.add(product);
  }
}
