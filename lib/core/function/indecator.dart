  import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget indicator({required int pages, required PageController controller}) {
    return SmoothPageIndicator(
      controller: controller,
      count: pages,
      effect: const WormEffect(
        dotColor: AppColors.lightGrey200,
        activeDotColor: AppColors.lightTypography500,
        dotHeight: 13,
        dotWidth: 13,
        type: WormType.thin,
      ),
    );
  }
