import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart';
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
              const SizedBox(height: 20),
              ProductCard(
                name: 'Classic Burger',
                price: 12.75,
                imagePath: AppAssets.product,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imagePath;
  final VoidCallback? onAdd;

  const ProductCard({
    super.key,
    this.name = "Classic Burger",
    this.price = 12.75,
    this.imagePath = AppAssets.product,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      height: 206,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey200),
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(imagePath),
          alignment: Alignment.topCenter,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${price.toStringAsFixed(2)}"),
                  GestureDetector(
                    onTap: onAdd,
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey200,
                      radius: 14,
                      child: Icon(
                        Icons.add,
                        color: AppColors.lightTypography500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
