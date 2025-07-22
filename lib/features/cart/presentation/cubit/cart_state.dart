import 'package:food_app/features/home/data/model/product_model.dart';

sealed class CartState {}

final class CartIntial extends CartState {}

final class CartUpdate extends CartState {
  final List<ProductModel> prdouct;
  final double totalPrice;
  CartUpdate({required this.totalPrice, required this.prdouct});
}
