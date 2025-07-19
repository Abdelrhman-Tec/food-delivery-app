import 'package:supabase_flutter/supabase_flutter.dart';

class WebServices {
  final supabase = Supabase.instance.client;

  Future<List<String>> getCategory() async {
    final response = await supabase.from('category').select('name');

    final List<String> bannerUrls = List<String>.from(
      response.map((row) => row['name'] as String),
    );
    return bannerUrls;
  }
}
