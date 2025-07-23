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

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        ontap: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderAuthSection(headerName: AppStrings.loginToAccount),
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
            const SizedBox(height: 10),
            _forgotPassword(
              context,
              ontap: () =>
                  Navigator.of(context).pushNamed(AppRouter.forgotPassword),
            ),
            const SizedBox(height: 40),
            isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    ontap: () async {
                      setState(() => isLoading = true);

                      await Future.delayed(const Duration(seconds: 1));

                      setState(() => isLoading = false);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRouter.homeNavBar);
                    },
                    width: double.infinity,
                    height: 52,
                    colorButton: AppColors.lightTypography500,
                    buttonName: AppStrings.login,
                    colorText: AppColors.lightWhite,
                  ),
            const SizedBox(height: 20),
            dontHaveAnAccount(
              context,
              ontap: () => Navigator.of(context).pushNamed(AppRouter.register),
              text: AppStrings.signUp,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _forgotPassword(context, {Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Center(
      child: Text(
        AppStrings.forgotPasswordButton,
        style: AppTextStyles.poppinsMedium700(
          context,
        ).copyWith(color: AppColors.lightTypography500),
      ),
    ),
  );
}
