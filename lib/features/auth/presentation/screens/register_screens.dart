import 'package:flutter/material.dart';
import 'package:food_app/config/routes/app_router.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_appbar.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:food_app/features/auth/presentation/widget/dont_have_an_account.dart';
import 'package:food_app/features/auth/presentation/widget/header_auth_section.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({super.key});

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  bool checkBox = false;
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
            HeaderAuthSection(headerName: AppStrings.createAccount),
            const SizedBox(height: 30),
            CustomTextFormField(
              showSuffixButton: false,
              hintText: AppStrings.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              showSuffixButton: true,
              hintText: AppStrings.password,
            ),
            _termsConditions(
              context: context,
              checkBox: checkBox,
              onChanged: (value) {
                setState(() {
                  checkBox = value ?? false;
                });
              },
            ),
            const SizedBox(height: 360),
            CustomButton(
              ontap: () {
                if (checkBox == true) {
                  Navigator.pushNamed(context, AppRouter.createProfile);
                }
              },
              width: double.infinity,
              height: 52,
              colorButton: !checkBox
                  ? AppColors.lightGrey300
                  : AppColors.lightTypography500,
              buttonName: AppStrings.createAccount,
              colorText: AppColors.lightWhite,
            ),
            const SizedBox(height: 10),
            dontHaveAnAccount(
              context,
              ontap: () => Navigator.of(context).pushNamed(AppRouter.login),
              text: AppStrings.signIn,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _termsConditions({
  required BuildContext context,
  required bool checkBox,
  required ValueChanged<bool?> onChanged,
}) {
  return Row(
    children: [
      Checkbox(
        activeColor: AppColors.lightTypography500,
        value: checkBox,
        onChanged: onChanged,
      ),
      Text(
        AppStrings.termsConditions,
        style: AppTextStyles.poppinsMedium400(
          context,
        ).copyWith(color: AppColors.lightGrey300),
      ),
    ],
  );
}
