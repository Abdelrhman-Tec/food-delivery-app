import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart';

class ProductInfoRow extends StatelessWidget {
  const ProductInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGrey200, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _InfoItem(
            iconPath: AppAssets.resourceIconsIconsVector4,
            color: AppColors.lightYellow,
            text: '4.8',
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColors.lightGrey200,
            indent: 8,
            endIndent: 8,
          ),
          _InfoItem(
            iconPath: AppAssets.resourceIconsIconsVector1,
            color: AppColors.lightRed,
            text: '300kcal',
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColors.lightGrey200,
            indent: 8,
            endIndent: 8,
          ),
          _InfoItem(
            iconPath: AppAssets.resourceIconsIconsVector2,
            color: AppColors.lightBlue,
            text: '20mins',
          ),
        ],
      ),
    );
  }
}
class _InfoItem extends StatelessWidget {
  final String iconPath;
  final Color color;
  final String text;

  const _InfoItem({
    required this.iconPath,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
