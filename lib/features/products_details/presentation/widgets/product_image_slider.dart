import 'package:flutter/material.dart';

class ProductImagesSlider extends StatelessWidget {
  final List<String> imagePaths;
  final PageController controller;

  const ProductImagesSlider({
    required this.imagePaths,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: controller,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}
