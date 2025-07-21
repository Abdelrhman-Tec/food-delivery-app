// ignore_for_file: avoid_print
import 'package:food_app/features/home/data/model/category_model.dart';
import 'package:food_app/features/home/data/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WebServices {
  final supabase = Supabase.instance.client;
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await supabase.from('products').select('*');

      return response
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await supabase.from('category').select('id, name');

      return response
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
