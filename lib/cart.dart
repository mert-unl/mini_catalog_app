import 'product.dart';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Cart {
  final List<Product> items = [];

  Future<void> add(Product product) async {
    items.add(product);
    await save();
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    final productList = items.map((product) => product.toJson()).toList();

    await prefs.setString('myCart', jsonEncode(productList));
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final savedCart = prefs.getString('myCart');

    if (savedCart == null) return;

    final List<dynamic> productList = jsonDecode(savedCart);

    items.clear();

    items.addAll(
      productList.map(
        (item) => Product.fromJson(Map<String, dynamic>.from(item)),
      ),
    );
  }
}
