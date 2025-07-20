import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/features/home/data/model/category_model.dart';

class CategoryTabs extends StatelessWidget {
  final CategoryModel categoryModel;
  final bool isSelected;

  const CategoryTabs({
    super.key,
    required this.categoryModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 42,
      decoration: BoxDecoration(
        color: !isSelected ? Colors.transparent : AppColors.lightGrey200,
        border: Border.all(
          color: !isSelected ? AppColors.lightGrey200 : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(
        child: Text(
          categoryModel.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
