class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      imageUrl: json['image'] as String,
    );
  }
}
