import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void _increase() {
    setState(() => quantity++);
  }

  void _decrease() {
    if (quantity > 1) setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 122,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey200),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: _decrease,
              child: const CircleAvatar(
                backgroundColor: AppColors.lightGrey200,
                child: Icon(Icons.remove),
              ),
            ),
            Text(quantity.toString()),
            GestureDetector(
              onTap: _increase,
              child: const CircleAvatar(
                backgroundColor: AppColors.lightGrey200,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
