import 'package:flutter/material.dart';
import 'package:food_app/app/food_app.dart';
import 'package:food_app/config/init/supabase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
  runApp(const FoodApp());
}
