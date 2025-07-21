import 'package:flutter/material.dart';

class AppColors {
  // Dark Mode Colors
  static const darkPrimary100 = Color(0xFF385758);
  static const darkPrimary200 = Color(0xFF355920);
  static const darkPrimary300 = Color(0xFF449923);
  static const darkPrimary400 = Color(0xFF509626);
  static const darkPrimary500 = Color(0xFF605231);
  static const darkPrimary600 = Color(0xFF769632);
  static const darkPrimary700 = Color(0xFF38504E);

  static const darkTypography100 = Color(0xFF77777E);
  static const darkTypography200 = Color(0xFF889487);
  static const darkTypography300 = Color(0xFF874987);
  static const darkTypography400 = Color(0xFF669907);
  static const darkTypography500 = Color(0xFF639603);

  static const darkGrey0 = Color(0xFF262728);
  static const darkGrey50 = Color(0xFF202526);
  static const darkGrey60 = Color(0xFF313538);
  static const darkGrey100 = Color(0xFF301838);
  static const darkGrey200 = Color(0xFF505030);
  static const darkGrey300 = Color(0xFF737473);
  static const darkGrey400 = Color(0xFF959998);
  static const darkGrey500 = Color(0xFF636003);

  static const darkRed = Color(0xFFFBAA57);
  static const darkYellow = Color(0xFFFBBC58);
  static const darkBlue = Color(0xFFAFB0CE);
  static const darkGreen = Color(0xFF8EC70F);
  static const darkOrange = Color(0xFFE43847);

  static const darkTransparentGrey520 = Color(0x0D050403); // 5%
  static const darkTransparentGrey0 = Color(0x1F242725); // 12%
  static const darkTransparentPrimary620 = Color(0x3D788432); // 24%
  static const darkBackgroundBlur = Color(0xA1262725); // 63%

  static const darkGradientLight = Color(0xFF405031);
  static const darkGradientDark = Color(0xFF405031);

  static const darkWhite = Color(0xFFFFFFFF);
  static const darkBlack = Color(0xFF0EFED2);

  // Light Mode Colors
  static const lightPrimary100 = Color(0xFFECF1E8);
  static const lightPrimary200 = Color(0xFFDEFCE4);
  static const lightPrimary300 = Color(0xFFB7BBC3);
  static const lightPrimary400 = Color(0xFFBDE472);
  static const lightPrimary500 = Color(0xFFF7D1FF);
  static const lightPrimary600 = Color(0xFF84A312);
  static const lightPrimary700 = Color(0xFFABBBBB);

  static const lightTypography100 = Color(0xFF8BBB55);
  static const lightTypography200 = Color(0xFF9195EE);
  static const lightTypography300 = Color(0xFF7976BB);
  static const lightTypography400 = Color(0xFF6665CC);
  static const lightTypography500 = Color(0xFF58A337);

  static const lightGrey0 = Color(0xFFFFFFFF);
  static const lightGrey50 = Color(0xFFF9FAFB);
  static const lightGrey100 = Color(0xFFF4F7F2);
  static const lightGrey200 = Color(0xFFEBEBE6);
  static const lightGrey300 = Color(0xFFA9ADA8);
  static const lightGrey400 = Color(0xFF9195EE);
  static const lightGrey500 = Color(0xFF8855EE);

  static const lightRed = Color(0xFFE25839);
  static const lightYellow = Color(0xFFF8AE42);
  static const lightBlue = Color(0xFF24B5D4);
  static const lightGreen = Color(0xFFAB8733);
  static const lightOrange = Color(0xFFEB712E);

  static const lightTransparentGrey500 = Color(0x0D053E5E);
  static const lightTransparentGrey0 = Color(0x37FFFFFF); // 22%
  static const lightTransparentPrimary600 = Color(0x3D84A312);
  static const lightBackgroundBlur = Color(0xCCFFA79E);

  static const lightGradientLight = Color(0xFF8EA010);
  static const lightGradientDark = Color(0xFF84A312);

  static const lightWhite = Color(0xFFFFFFFF);
  static const lightBlack = Color(0xFF233522);
}

extension AppThemeColors on ThemeData {
  Color get primary100 => brightness == Brightness.dark
      ? AppColors.darkPrimary100
      : AppColors.lightPrimary100;
  Color get primary200 => brightness == Brightness.dark
      ? AppColors.darkPrimary200
      : AppColors.lightPrimary200;
  Color get primary300 => brightness == Brightness.dark
      ? AppColors.darkPrimary300
      : AppColors.lightPrimary300;
  Color get primary400 => brightness == Brightness.dark
      ? AppColors.darkPrimary400
      : AppColors.lightPrimary400;
  Color get primary500 => brightness == Brightness.dark
      ? AppColors.darkPrimary500
      : AppColors.lightPrimary500;
  Color get primary600 => brightness == Brightness.dark
      ? AppColors.darkPrimary600
      : AppColors.lightPrimary600;
  Color get primary700 => brightness == Brightness.dark
      ? AppColors.darkPrimary700
      : AppColors.lightPrimary700;

  Color get typography100 => brightness == Brightness.dark
      ? AppColors.darkTypography100
      : AppColors.lightTypography100;
  Color get typography200 => brightness == Brightness.dark
      ? AppColors.darkTypography200
      : AppColors.lightTypography200;
  Color get typography300 => brightness == Brightness.dark
      ? AppColors.darkTypography300
      : AppColors.lightTypography300;
  Color get typography400 => brightness == Brightness.dark
      ? AppColors.darkTypography400
      : AppColors.lightTypography400;
  Color get typography500 => brightness == Brightness.dark
      ? AppColors.darkTypography500
      : AppColors.lightTypography500;

  Color get grey0 => brightness == Brightness.dark
      ? AppColors.darkGrey0
      : AppColors.lightGrey0;
  Color get grey50 => brightness == Brightness.dark
      ? AppColors.darkGrey50
      : AppColors.lightGrey50;
  Color get grey60 => brightness == Brightness.dark
      ? AppColors.darkGrey60
      : AppColors.lightGrey100; // No lightGrey60, using 100
  Color get grey100 => brightness == Brightness.dark
      ? AppColors.darkGrey100
      : AppColors.lightGrey100;
  Color get grey200 => brightness == Brightness.dark
      ? AppColors.darkGrey200
      : AppColors.lightGrey200;
  Color get grey300 => brightness == Brightness.dark
      ? AppColors.darkGrey300
      : AppColors.lightGrey300;
  Color get grey400 => brightness == Brightness.dark
      ? AppColors.darkGrey400
      : AppColors.lightGrey400;
  Color get grey500 => brightness == Brightness.dark
      ? AppColors.darkGrey500
      : AppColors.lightGrey500;

  Color get red =>
      brightness == Brightness.dark ? AppColors.darkRed : AppColors.lightRed;
  Color get yellow => brightness == Brightness.dark
      ? AppColors.darkYellow
      : AppColors.lightYellow;
  Color get blue =>
      brightness == Brightness.dark ? AppColors.darkBlue : AppColors.lightBlue;
  Color get green => brightness == Brightness.dark
      ? AppColors.darkGreen
      : AppColors.lightGreen;
  Color get orange => brightness == Brightness.dark
      ? AppColors.darkOrange
      : AppColors.lightOrange;

  Color get transparentGrey => brightness == Brightness.dark
      ? AppColors.darkTransparentGrey520
      : AppColors.lightTransparentGrey500;
  Color get transparentPrimary => brightness == Brightness.dark
      ? AppColors.darkTransparentPrimary620
      : AppColors.lightTransparentPrimary600;
  Color get backgroundBlur => brightness == Brightness.dark
      ? AppColors.darkBackgroundBlur
      : AppColors.lightBackgroundBlur;

  Color get gradientLight => brightness == Brightness.dark
      ? AppColors.darkGradientLight
      : AppColors.lightGradientLight;
  Color get gradientDark => brightness == Brightness.dark
      ? AppColors.darkGradientDark
      : AppColors.lightGradientDark;

  Color get white => brightness == Brightness.dark
      ? AppColors.darkWhite
      : AppColors.lightWhite;
  Color get black => brightness == Brightness.dark
      ? AppColors.darkBlack
      : AppColors.lightBlack;
}
