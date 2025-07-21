import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/features/home/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  final Function()? ontap;

  const ProductCard({super.key, required this.productModel, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 166,
        height: 206,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey200),
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: AssetImage(productModel.imagePath[0]),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${productModel.price.toStringAsFixed(2)}"),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: AppColors.lightGrey200,
                        radius: 14,
                        child: Icon(
                          Icons.add,
                          color: AppColors.lightTypography500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
