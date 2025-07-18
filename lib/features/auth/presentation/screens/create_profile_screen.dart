import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/widgets/custom_appbar.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:food_app/features/auth/presentation/widget/header_auth_section.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        ontap: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderAuthSection(headerName: AppStrings.createProfile),
            _profileImage(),
            _buildProfileFormFields(),
            const SizedBox(height: 230),
            CustomButton(
              width: double.infinity,
              height: 52,
              colorButton: AppColors.lightTypography500,
              buttonName: AppStrings.continueText,
              colorText: AppColors.lightWhite,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _profileImage() {
  return Stack(
    children: [
      Center(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.lightGrey300,
          child: SvgPicture.asset(
            AppAssets.resourceIconsIconsProfile,
            width: 70,
            color: AppColors.lightWhite,
          ),
        ),
      ),
      Positioned(
        left: 90,
        right: 0,
        bottom: 0,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.lightWhite,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: AppColors.lightGrey100,
            child: SvgPicture.asset(
              AppAssets.resourceIconsIconsSubtract,
              color: AppColors.lightGrey300,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildProfileFormFields() {
  return Column(
    children: [
      const SizedBox(height: 20),

      CustomTextFormField(
        showSuffixButton: false,
        hintText: AppStrings.fullName,
      ),

      const SizedBox(height: 20),

      Row(
        children: [
          Flexible(
            flex: 1,
            child: CustomTextFormField(
              showSuffixButton: false,
              hintText: '+00',
            ),
          ),
          const SizedBox(width: 10),

          Flexible(
            flex: 4,
            child: CustomTextFormField(
              showSuffixButton: false,
              hintText: AppStrings.phoneNumber,
            ),
          ),
        ],
      ),

      const SizedBox(height: 20),

      CustomTextFormField(
        showSuffixButton: false,
        hintText: AppStrings.dateOfBirth,
      ),
    ],
  );
}
