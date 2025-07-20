import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://azzqdamnuyolykqftbzq.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF6enFkYW1udXlvbHlrcWZ0YnpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI3OTI1MzMsImV4cCI6MjA2ODM2ODUzM30.c16yjlAivWqSfkzCdflnwxwrwxCjcCskBdE5Fp-U_e0',
    );
  }
}
