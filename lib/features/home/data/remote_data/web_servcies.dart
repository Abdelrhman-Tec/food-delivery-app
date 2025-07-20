import 'package:supabase_flutter/supabase_flutter.dart';

class WebServices {
  final supabase = Supabase.instance.client;

  Future<List<String>> getCategories() async {
    try {
      final response = await supabase.from('category').select('name');

      return response.map<String>((row) => row['name'].toString()).toList();
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
