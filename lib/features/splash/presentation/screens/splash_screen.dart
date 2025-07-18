import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/config/routes/app_router.dart';
import 'package:food_app/core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _delayed(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(AppAssets.resourceLogoTypeSizeDefault),
          ),
        ],
      ),
    );
  }
}

void _delayed(BuildContext context) {
  Future.delayed(Duration(seconds: 2), () {
    Navigator.of(context).pushReplacementNamed(AppRouter.onboarding);
  });
}
