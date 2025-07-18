import 'package:flutter/material.dart';

class AppTextStyles {
  // Font Families
  static const String poppins = 'Poppins';
  static const String roboto = 'Roboto';
  static const String robotoMono = 'RobotoMono';

  // Poppins Text Styles
  static TextStyle poppinsHeading1(BuildContext context) {
    return TextStyle(
      fontFamily: poppins,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.02,
      height: 1.2,
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

  static TextStyle poppinsHeading2(BuildContext context) {
    return TextStyle(
      fontFamily: poppins,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.0,
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

  static TextStyle poppinsLarge(
    BuildContext context, {
    FontWeight weight = FontWeight.bold,
  }) {
    return TextStyle(
      fontFamily: poppins,
      fontSize: 17,
      fontWeight: weight,
      letterSpacing: -0.01,
      height: 1.5,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle poppinsMedium(
    BuildContext context, {
    FontWeight weight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: poppins,
      fontSize: 15,
      fontWeight: weight,
      letterSpacing: 0,
      height: weight == FontWeight.normal ? 1.7 : 1.5,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle poppinsSmall(
    BuildContext context, {
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      fontFamily: poppins,
      fontSize: 12,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.7,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  // Roboto Text Styles
  static TextStyle robotoHeading(BuildContext context) {
    return TextStyle(
      fontFamily: roboto,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.02,
      height: 1.0,
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

  static TextStyle robotoLarge(BuildContext context) {
    return TextStyle(
      fontFamily: roboto,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.5,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle robotoMedium(BuildContext context) {
    return TextStyle(
      fontFamily: roboto,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.5,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle robotoSmall(BuildContext context) {
    return TextStyle(
      fontFamily: roboto,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.5,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  // Roboto Mono Text Styles
  static TextStyle robotoMonoMedium(BuildContext context) {
    return TextStyle(
      fontFamily: robotoMono,
      fontSize: 15,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      height: 1.7,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  // Convenience methods for common variations
  static TextStyle poppinsLarge400(BuildContext context) =>
      poppinsLarge(context, weight: FontWeight.normal);
  static TextStyle poppinsLarge600(BuildContext context) =>
      poppinsLarge(context, weight: FontWeight.w600);
  static TextStyle poppinsLarge700(BuildContext context) =>
      poppinsLarge(context, weight: FontWeight.bold);

  static TextStyle poppinsMedium400(BuildContext context) =>
      poppinsMedium(context, weight: FontWeight.normal);
  static TextStyle poppinsMedium600(BuildContext context) =>
      poppinsMedium(context, weight: FontWeight.w600);
  static TextStyle poppinsMedium700(BuildContext context) =>
      poppinsMedium(context, weight: FontWeight.bold);

  static TextStyle poppinsSmall500(BuildContext context) =>
      poppinsSmall(context, weight: FontWeight.w500);
  static TextStyle poppinsSmall600(BuildContext context) =>
      poppinsSmall(context, weight: FontWeight.w600);
  static TextStyle poppinsSmall700(BuildContext context) =>
      poppinsSmall(context, weight: FontWeight.bold);
}

// Extension for easy access to text styles via BuildContext
extension AppTextStylesExtension on BuildContext {
  TextStyle get heading1 => AppTextStyles.poppinsHeading1(this);
  TextStyle get heading2 => AppTextStyles.poppinsHeading2(this);
  TextStyle get robotoHeading => AppTextStyles.robotoHeading(this);

  TextStyle get large => AppTextStyles.poppinsLarge(this);
  TextStyle get large400 => AppTextStyles.poppinsLarge400(this);
  TextStyle get large600 => AppTextStyles.poppinsLarge600(this);
  TextStyle get large700 => AppTextStyles.poppinsLarge700(this);

  TextStyle get medium => AppTextStyles.poppinsMedium(this);
  TextStyle get medium400 => AppTextStyles.poppinsMedium400(this);
  TextStyle get medium600 => AppTextStyles.poppinsMedium600(this);
  TextStyle get medium700 => AppTextStyles.poppinsMedium700(this);

  TextStyle get small => AppTextStyles.poppinsSmall(this);
  TextStyle get small500 => AppTextStyles.poppinsSmall500(this);
  TextStyle get small600 => AppTextStyles.poppinsSmall600(this);
  TextStyle get small700 => AppTextStyles.poppinsSmall700(this);

  TextStyle get robotoLarge => AppTextStyles.robotoLarge(this);
  TextStyle get robotoMedium => AppTextStyles.robotoMedium(this);
  TextStyle get robotoSmall => AppTextStyles.robotoSmall(this);

  TextStyle get robotoMonoMedium => AppTextStyles.robotoMonoMedium(this);
}
