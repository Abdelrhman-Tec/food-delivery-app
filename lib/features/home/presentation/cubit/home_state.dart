import 'package:food_app/features/home/data/model/product_model.dart';
import 'package:food_app/features/home/data/model/category_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

// Products
final class ProductsLoading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<ProductModel> products;
  ProductsLoaded(this.products);
}

final class ProductsError extends HomeState {
  final String message;
  ProductsError(this.message);
}

// Categories
final class CategoriesLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<CategoryModel> categories;
  CategoriesLoaded(this.categories);
}

final class CategoriesError extends HomeState {
  final String message;
  CategoriesError(this.message);
}
