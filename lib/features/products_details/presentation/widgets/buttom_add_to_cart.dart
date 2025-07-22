import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_button.dart';

class BottomPriceAndButton extends StatelessWidget {
  final Function()? ontap;
  final double price;

  const BottomPriceAndButton({super.key, required this.price, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('\$$price', style: AppTextStyles.robotoHeading(context)),
        const Spacer(),
        CustomButton(
          ontap: ontap,
          width: 224,
          height: 52,
          colorButton: AppColors.lightTypography500,
          buttonName: AppStrings.addToCart,
          colorText: AppColors.lightWhite,
        ),
      ],
    );
  }
}
