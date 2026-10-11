class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String imageUrl;
  final Map<String, String> specs;

  const Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      imageUrl: json['image'] as String,
      specs: Map<String, String>.from(json['specs'] as Map),
    );
  }
}
