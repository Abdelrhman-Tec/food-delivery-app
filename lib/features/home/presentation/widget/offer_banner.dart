import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/banners/banner1.png',
    'assets/banners/banner1.png',
  ];

  OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: bannerImages.length,
        controller: PageController(viewportFraction: 1),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(bannerImages[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
