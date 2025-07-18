import 'package:flutter/material.dart';
import 'package:food_app/config/routes/app_router.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_appbar.dart';
import 'package:food_app/core/widgets/custom_button.dart';

class OnboaringScreenLogin extends StatelessWidget {
  const OnboaringScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [_onboardingSection(context), _socialAuthButtons(context)],
        ),
      ),
    );
  }
}

Widget _onboardingSection(context) {
  return Column(
    children: [
      Image.asset(
        AppAssets.resourceOnboardingIllustrationsBurgerDarkMode,
        fit: BoxFit.contain,
      ),
      Text(
        AppStrings.joinDelicious,
        style: AppTextStyles.poppinsHeading1(context).copyWith(fontSize: 32),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget _socialAuthButtons(context) {
  return Column(
    children: [
      const SizedBox(height: 70),
      CustomButton(
        iconAsset: AppAssets.appleIcon,
        height: 52,
        colorButton: AppColors.lightTypography100,
        buttonName: AppStrings.continueWithApple,
        colorText: AppColors.lightWhite,
      ),
      const SizedBox(height: 10),
      Text(
        AppStrings.or,
        style: AppTextStyles.poppinsSmall500(
          context,
        ).copyWith(fontWeight: FontWeight.w600, color: AppColors.lightGrey300),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: CustomButton(
              width: 110,
              iconAsset: AppAssets.googleIcon,
              height: 52,
              colorButton: AppColors.lightGrey200,
              buttonName: '',
              colorText: AppColors.lightWhite,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButton(
              width: 110,
              iconAsset: AppAssets.facebookIcon,
              height: 52,
              colorButton: AppColors.lightGrey200,
              buttonName: '',
              colorText: AppColors.lightWhite,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButton(
              ontap: () => Navigator.of(context).pushNamed(AppRouter.login),
              width: 110,
              iconAsset: AppAssets.emailIcon,
              height: 52,
              colorButton: AppColors.lightGrey200,
              buttonName: '',
              colorText: AppColors.lightWhite,
            ),
          ),
        ],
      ),
    ],
  );
}
