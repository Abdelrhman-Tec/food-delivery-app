import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final bool showSuffixButton;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.showSuffixButton,
    required this.hintText,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.showSuffixButton ? _obscureText : false,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.poppinsMedium400(
          context,
        ).copyWith(color: AppColors.lightGrey300),
        suffixIcon: widget.showSuffixButton
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
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
