import 'package:flutter/material.dart';
import 'package:food_app/config/routes/app_router.dart';
import 'package:food_app/core/function/indecator.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_appbar.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/onboarding/data/datasources/model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: false,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (_, index) {
                    final item = OnboardingModel.onboardingList[index];
                    return _onboardingSection(
                      context,
                      image: item.image,
                      title: item.title,
                      subTitle: item.subTitle,
                    );
                  },
                  itemCount: OnboardingModel.onboardingList.length,
                ),
              ),
              indicator(
                controller: _controller,
                pages: OnboardingModel.onboardingList.length,
              ),
              const SizedBox(height: 30),
              _buttonSection(
                context,
                ontap: () {
                  _nextPage();
                },
                // Change the button label to "Start" when reaching the last onboarding page
                text:
                    (currentIndex == OnboardingModel.onboardingList.length - 1)
                    ? AppStrings.start
                    : AppStrings.next,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _nextPage() {
    if (currentIndex < OnboardingModel.onboardingList.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRouter.onboardingLogin);
    }
  }


  Widget _onboardingSection(
    BuildContext context, {
    required String image,
    required String title,
    required String subTitle,
  }) {
    return Column(
      children: [
        Image.asset(image, fit: BoxFit.contain),
        Text(
          title,
          style: AppTextStyles.poppinsHeading1(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          subTitle,
          style: AppTextStyles.poppinsMedium400(
            context,
          ).copyWith(color: AppColors.darkGrey300),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buttonSection(
    BuildContext context, {
    Function()? ontap,
    required String text,
  }) {
    return Row(
      children: [
        if (currentIndex != OnboardingModel.onboardingList.length - 1) ...[
          CustomButton(
            ontap: () => Navigator.of(
              context,
            ).pushReplacementNamed(AppRouter.onboardingLogin),
            width: 100,
            height: 52,
            colorButton: AppColors.lightPrimary100,
            buttonName: AppStrings.skip,
            colorText: AppColors.lightTypography100,
          ),
        ] else ...[
          SizedBox.shrink(),
        ],

        const SizedBox(width: 10),
        Expanded(
          child: CustomButton(
            ontap: ontap,
            width: 241,
            height: 52,
            colorButton: AppColors.lightTypography500,
            buttonName: text,
            colorText: AppColors.lightWhite,
          ),
        ),
      ],
    );
  }
}
