import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.hiUser,
                style: AppTextStyles.poppinsLarge400(context),
              ),
              const SizedBox(height: 4),
              Text(
                AppStrings.whatCraving,
                style: AppTextStyles.poppinsLarge(context),
              ),
            ],
          ),
        ),
        const CircleAvatar(radius: 20, child: Icon(Icons.person)),
      ],
    );
  }
}
