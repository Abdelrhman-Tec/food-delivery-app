import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class HeaderAuthSection extends StatelessWidget {
  final String headerName;
  const HeaderAuthSection({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headerName,
          style: AppTextStyles.poppinsHeading1(context).copyWith(fontSize: 32),
        ),
      ],
    );
  }
}
