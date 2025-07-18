import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? iconAsset;
  final Color colorButton;
  final String buttonName;
  final Color colorText;
  final Function()? ontap;
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.colorButton,
    required this.buttonName,
    required this.colorText,
    this.ontap,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconAsset == null
                ? SizedBox.shrink()
                : SvgPicture.asset(
                    iconAsset!,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
            const SizedBox(width: 10),
            Center(
              child: Text(
                buttonName,
                style: AppTextStyles.poppinsMedium700(
                  context,
                ).copyWith(color: colorText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
