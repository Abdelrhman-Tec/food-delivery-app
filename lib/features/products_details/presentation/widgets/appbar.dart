import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
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
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 20,
              color: isFavorite ? AppColors.lightRed : AppColors.lightGrey300,
            ),
          ),
        ],
      ),
    );
  }
}
