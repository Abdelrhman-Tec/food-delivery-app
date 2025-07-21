class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int ratings;
  final int categoryId;
  final String imagePath;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ratings,
    required this.categoryId,
    required this.imagePath,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
      ratings: json['ratings'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      imagePath: json['image_path'] ?? '',
    );
  }
}
