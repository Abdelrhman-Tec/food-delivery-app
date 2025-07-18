import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_appbar.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/auth/presentation/widget/header_auth_section.dart';

class ForgotPasswordScreens extends StatefulWidget {
  const ForgotPasswordScreens({super.key});

  @override
  State<ForgotPasswordScreens> createState() => _ForgotPasswordScreensState();
}

class _ForgotPasswordScreensState extends State<ForgotPasswordScreens> {
  String _isNotEmpty = '';
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        ontap: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderAuthSection(headerName: AppStrings.forgotPassword),
            const SizedBox(height: 10),
            Text(
              AppStrings.verificationCodeSent,
              style: AppTextStyles.poppinsMedium400(
                context,
              ).copyWith(color: AppColors.lightGrey300),
            ),
            const SizedBox(height: 50),
            Center(
              child: _otpField(
                context: context,
                onSubmit: (value) {
                  setState(() {
                    _isNotEmpty = value;
                  });
                  log("OTP Submitted: $value");
                },
              ),
            ),
            const SizedBox(height: 30),
            _otpResendText(),
            const SizedBox(height: 370),
            CustomButton(
              width: double.infinity,
              height: 52,
              colorButton: _isNotEmpty.isEmpty
                  ? AppColors.lightGrey300
                  : AppColors.lightTypography500,
              buttonName: AppStrings.continueText,
              colorText: AppColors.lightWhite,
              ontap: _isNotEmpty.isNotEmpty
                  ? () {
                      log("Continue button pressed with OTP: $_isNotEmpty");
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpField({
    required BuildContext context,
    required Function(String) onSubmit,
    int fieldsCount = 6,
  }) {
    return OtpTextField(
      numberOfFields: fieldsCount,
      borderColor: Theme.of(context).primaryColor,
      focusedBorderColor: Theme.of(context).primaryColor,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(10),
      fieldWidth: 45,
      textStyle: const TextStyle(fontSize: 18),
      onSubmit: onSubmit,
    );
  }

  Widget _otpResendText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Didn't receive the code? "),
        Text(formattedTime, style: const TextStyle(color: Colors.grey)),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: _secondsRemaining > 0
              ? null
              : () {
                  print("Resending OTP...");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.lightTypography500,
                      content: Text("OTP has been resent."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  _startTimer();
                },
          child: Text(
            'Resend',
            style: TextStyle(
              color: _secondsRemaining > 0 ? Colors.grey : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
