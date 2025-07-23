import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final Function()? ontap;
  final String? title;
  final String? imagePath;
  const CustomAppBar({
    super.key,
    required this.showBackButton,
    this.ontap,
    this.title,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showBackButton) ...[
            GestureDetector(
              onTap: ontap,
              child: Center(
                child: Icon(Icons.arrow_back_ios_new_outlined, size: 18),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              AppStrings.back,
              style: AppTextStyles.poppinsMedium700(
                context,
              ).copyWith(fontSize: 20),
            ),
            const Spacer(),
          ],
          !showBackButton ? const Spacer(flex: 2) : SizedBox.shrink(),
          showBackButton
              ? Center(child: SvgPicture.asset(AppAssets.resourceLogoBobo))
              : Row(
                  children: [
                    imagePath != null
                        ? SvgPicture.asset(imagePath!, width: 30)
                        : SizedBox.shrink(),
                    title != null
                        ? Center(
                            child: Text(
                              title!,
                              style: AppTextStyles.robotoHeading(
                                context,
                              ).copyWith(fontSize: 20),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
