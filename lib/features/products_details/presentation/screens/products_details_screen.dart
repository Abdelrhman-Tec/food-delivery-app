import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/function/indecator.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_app/features/home/data/model/product_model.dart';
import 'package:food_app/features/products_details/presentation/widgets/appbar.dart';
import 'package:food_app/features/products_details/presentation/widgets/buttom_add_to_cart.dart';
import 'package:food_app/features/products_details/presentation/widgets/product_descreiption.dart';
import 'package:food_app/features/products_details/presentation/widgets/product_image_slider.dart';
import 'package:food_app/features/products_details/presentation/widgets/product_info.dart';
import 'package:food_app/features/products_details/presentation/widgets/quantity_selector.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final ProductModel? productModel;

  const ProductsDetailsScreen({super.key, this.productModel});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final product = widget.productModel;

    if (product == null) {
      return const Scaffold(body: Center(child: Text('No product selected')));
    }
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductImagesSlider(
                imagePaths: product.imagePath,
                controller: _controller,
              ),
              const SizedBox(height: 10),
              indicator(
                pages: product.imagePath.length,
                controller: _controller,
              ),
              const SizedBox(height: 30),
              const ProductInfoRow(),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Pepperoni Cheese Pizza',
                  style: AppTextStyles.robotoHeading(context),
                ),
              ),
              const SizedBox(height: 10),
              QuantitySelector(),
              const SizedBox(height: 10),
              const ProductDescription(),
              const SizedBox(height: 80),
              BottomPriceAndButton(
                price: product.price,
                ontap: () => context.read<CartCubit>().addToCart(product),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
