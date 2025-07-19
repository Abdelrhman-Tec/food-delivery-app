import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/widget/category_tabs.dart';
import 'package:food_app/features/home/presentation/widget/header_section.dart';
import 'package:food_app/features/home/presentation/widget/offer_banner.dart';
import 'package:food_app/features/home/presentation/widget/search_bar_section.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            HeaderSection(),
            const SizedBox(height: 30),
            SearchBarSection(),
            const SizedBox(height: 20),
            OfferBanner(),
            const SizedBox(height: 20),
            
            CategoryTabs(text: ''),
          ],
        ),
      ),
    );
  }
}




