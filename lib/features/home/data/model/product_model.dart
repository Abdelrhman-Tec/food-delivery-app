import 'package:food_app/core/utils/app_assets.dart';

class ProductModel {
  final String name;
  final double price;
  final List<String> imagePath;
  final int quantity;

  ProductModel({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  ProductModel copyWith({
    String? name,
    double? price,
    List<String>? imagePath,
    int? quantity,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
    );
  }

  static List<ProductModel> productList = [
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: [AppAssets.product2, AppAssets.product, AppAssets.product3],
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: [AppAssets.product2],
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: [AppAssets.product2],
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: [AppAssets.product2],
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: [AppAssets.product2],
    ),
  ];
}
