import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/screens/create_profile_screen.dart';
import 'package:food_app/features/auth/presentation/screens/forgot_password_screens.dart';
import 'package:food_app/features/auth/presentation/screens/login_screens.dart';
import 'package:food_app/features/auth/presentation/screens/register_screens.dart';
import 'package:food_app/features/home/presentation/screens/home_screen.dart';
import 'package:food_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:food_app/features/onboarding/presentation/screens/onboaring_screen_login.dart';
import 'package:food_app/features/products_details/presentation/screens/products_details_screen.dart';
import 'package:food_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  // auth routes
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String verifyEmail = '/verify-email';
  static const String verifyPhone = '/verify-phone';
  static const String verifyOTP = '/verify-otp';
  static const String createProfile = '/createProfile';
  static const String productsDetails = '/productsDetails';
  //splash routes
  static const String splash = '/splash';
  //onboarding routes
  static const String onboarding = '/onboarding';
  static const String onboardingLogin = '/onboardingLogin';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case onboardingLogin:
        return MaterialPageRoute(
          builder: (context) => const OnboaringScreenLogin(),
        );
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreens());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreens());
      case forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreens(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case createProfile:
        return MaterialPageRoute(
          builder: (context) => const CreateProfileScreen(),
        );
      case productsDetails:
        return MaterialPageRoute(
          builder: (context) => const ProductsDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
