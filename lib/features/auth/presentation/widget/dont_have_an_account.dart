import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

Widget dontHaveAnAccount(context, {Function()? ontap, required String text}) {
  return GestureDetector(
    onTap: ontap,
    child: Text.rich(
      TextSpan(
        text: AppStrings.dontHaveAccount,
        children: [
          TextSpan(
            text: text,
            style: AppTextStyles.poppinsMedium700(context),
          ),
        ],
      ),
    ),
  );
}