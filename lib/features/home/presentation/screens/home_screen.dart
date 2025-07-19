import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            HeaderSection(),
            const SizedBox(height: 30),
            SearchBarSection(),
            const SizedBox(height: 20),
            OfferBanner(),
            const SizedBox(height: 20),
            CategoryTabs(text: ''),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.hiUser,
                style: AppTextStyles.poppinsLarge400(context),
              ),
              const SizedBox(height: 4),
              Text(
                AppStrings.whatCraving,
                style: AppTextStyles.poppinsLarge(context),
              ),
            ],
          ),
        ),
        const CircleAvatar(radius: 20, child: Icon(Icons.person)),
      ],
    );
  }
}

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: AppStrings.search,
        hintStyle: AppTextStyles.poppinsMedium400(
          context,
        ).copyWith(color: AppColors.darkTypography200),
        prefixIcon: Icon(Icons.search, color: AppColors.lightGrey300),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.lightGrey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.lightGrey300),
        ),
      ),
    );
  }
}

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

class CategoryTabs extends StatelessWidget {
  final String text;
  const CategoryTabs({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.lightGrey200,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(child: Text(text)),
    );
  }
}
