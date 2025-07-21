import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

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
          children: const [
            CircleAvatar(
              backgroundColor: AppColors.lightGrey200,
              child: Icon(Icons.remove),
            ),
            Text('1'),
            CircleAvatar(
              backgroundColor: AppColors.lightGrey200,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
