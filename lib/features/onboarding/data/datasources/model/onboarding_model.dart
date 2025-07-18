import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_strings.dart';

class OnboardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: AppStrings.welcomeTitle,
      subTitle: AppStrings.edibleApp,
      image: AppAssets.resourceOnboardingIllustrationsChefCookingLightMode,
    ),
    OnboardingModel(
      title: AppStrings.nitroDelivery,
      subTitle: AppStrings.fastDelivery,
      image: AppAssets.resourceOnboardingIllustrationsDeliveryGuyLightMode,
    ),
    OnboardingModel(
      title: AppStrings.bestiesBirthday,
      subTitle: AppStrings.plusMembers,
      image: AppAssets.resourceOnboardingIllustrationsBirthdayGirlLightMode,
    ),
  ];
}
