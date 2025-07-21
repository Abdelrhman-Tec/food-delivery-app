import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => ProductDescriptionState();
}

class ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false;
  final String description =
      'A classic favorite! Indulge in a crispy, thin crust topped with rich tomato sauce, layers of gooey mozzarella cheese, and delicious pepperoni slices. Perfectly baked with a hint of herbs for a mouth-watering experience in every bite.';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(
          text: description,
          style: AppTextStyles.poppinsSmall500(context),
        );

        final tp = TextPainter(
          text: span,
          maxLines: 2,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              maxLines: isExpanded ? null : 2,
              overflow: TextOverflow.fade,
              style: AppTextStyles.poppinsSmall500(context),
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: Text(
                  isExpanded ? 'Read less' : 'Read more...',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
          ],
        );
      },
    );
  }
}
