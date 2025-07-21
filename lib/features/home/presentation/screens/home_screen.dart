import 'package:flutter/material.dart';
import 'package:food_app/features/home/data/model/category_model.dart';
import 'package:food_app/features/home/data/model/product_model.dart';
import 'package:food_app/features/home/presentation/widget/category_tabs.dart';
import 'package:food_app/features/home/presentation/widget/header_section.dart';
import 'package:food_app/features/home/presentation/widget/offer_banner.dart';
import 'package:food_app/features/home/presentation/widget/product_card.dart';
import 'package:food_app/features/home/presentation/widget/search_bar_section.dart';
import 'package:food_app/features/products_details/presentation/screens/products_details_screen.dart';

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

  Widget _buildProductList() {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.3 / 1.8,
        ),
        itemBuilder: (context, index) {
          final item = ProductModel.productList[index];
          return ProductCard(
            productModel: item,
            ontap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductsDetailsScreen(productModel: item),
              ),
            ),
          );
        },
        itemCount: ProductModel.productList.length,
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
              const SizedBox(height: 5),
              _buildProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
