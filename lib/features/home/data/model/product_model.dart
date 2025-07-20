import 'package:food_app/core/utils/app_assets.dart';

class ProductModel {
  final String name;
  final double price;
  final String imagePath;

  ProductModel({
    required this.name,
    required this.price,
    required this.imagePath,
  });

  static List<ProductModel> productList = [
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: AppAssets.product,
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: AppAssets.product,
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: AppAssets.product,
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: AppAssets.product,
    ),
    ProductModel(
      name: 'Classic Burger',
      price: 12.75,
      imagePath: AppAssets.product,
    ),
  ];
}
