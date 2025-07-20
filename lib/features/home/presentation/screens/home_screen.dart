import 'package:flutter/material.dart';
import 'package:food_app/features/home/data/model/category_model.dart';
import 'package:food_app/features/home/presentation/widget/category_tabs.dart';
import 'package:food_app/features/home/presentation/widget/header_section.dart';
import 'package:food_app/features/home/presentation/widget/offer_banner.dart';
import 'package:food_app/features/home/presentation/widget/search_bar_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;

  void _onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: CategoryModel.categoryList.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => _onCategorySelected(index),
              child: CategoryTabs(categoryModel: item, isSelected: isSelected),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 30),
              const SearchBarSection(),
              const SizedBox(height: 20),
              OfferBanner(),
              const SizedBox(height: 20),
              _buildCategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
