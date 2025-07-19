import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';

class CategoryTabs extends StatelessWidget {
  final String text;
  const CategoryTabs({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.lightGrey200,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(child: Text(text)),
    );
  }
}
