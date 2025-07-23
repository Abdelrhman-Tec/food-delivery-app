import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/app_assets.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_appbar.dart';
import 'package:food_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:food_app/features/home/data/model/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: AppStrings.cart,
        imagePath: AppAssets.resourceIconsIconsCart,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartUpdate) {
                    if (state.prdouct.isEmpty) {
                      return const Center(child: Text('Cart is empty'));
                    }
                    return ListView.builder(
                      itemCount: state.prdouct.length,
                      itemBuilder: (context, i) {
                        return CartItemWidget(product: state.prdouct[i]);
                      },
                    );
                  } else {
                    return const Center(child: Text(AppStrings.emptyCart));
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartUpdate && state.prdouct.isNotEmpty) {
                  final subtotal = state.prdouct.fold<double>(
                    0,
                    (total, product) =>
                        total + (product.price * product.quantity),
                  );
                  const delivery = 3.99;
                  final total = subtotal + delivery;

                  return Column(
                    children: [
                      Row(
                        children: [
                          const Text("Subtotal"),
                          const Spacer(),
                          Text("\$${subtotal.toStringAsFixed(2)}"),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Text("Delivery Charges"),
                          Spacer(),
                          Text("+\$3.99"),
                        ],
                      ),
                      const Divider(thickness: 0.09, color: Colors.black),
                      Row(
                        children: [
                          const Text("Total"),
                          const Spacer(),
                          Text("\$${total.toStringAsFixed(2)}"),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey200),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              product.imagePath[0],
              width: 90,
              height: 77,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.poppinsMedium(context).copyWith(
                    color: AppColors.lightGrey300,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.robotoMedium(context),
                    ),
                    const Spacer(),
                    QuantitySelector(product: product),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final ProductModel product;

  const QuantitySelector({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        int quantity = product.quantity;

        if (state is CartUpdate) {
          final cartProduct = state.prdouct.firstWhere(
            (p) => p.name == product.name,
            orElse: () => product,
          );
          quantity = cartProduct.quantity;
        }

        return Container(
          width: 90,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightGrey50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<CartCubit>().decreaseQuantity(product);
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.lightGrey100,
                  child: Icon(Icons.remove, size: 16),
                ),
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  context.read<CartCubit>().increaseQuantity(product);
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.lightGrey100,
                  child: Icon(Icons.add, size: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
