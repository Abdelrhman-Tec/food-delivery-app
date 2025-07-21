import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart' show AppColors;
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
          ),
          const SizedBox(width: 10),
          Text(
            AppStrings.back,
            style: AppTextStyles.poppinsMedium700(
              context,
            ).copyWith(fontSize: 20),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.resourceIconsIconsShare,
            width: 25,
            color: AppColors.lightGrey300,
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.favorite_border_outlined,
            size: 20,
            color: AppColors.lightGrey300,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
