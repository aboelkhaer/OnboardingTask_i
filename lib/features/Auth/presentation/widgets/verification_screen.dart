import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:task_i/core/utilities/colors.dart';
import 'package:task_i/features/Auth/presentation/cubit/auth_cubit.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerificationCode(
          onCompleted: (val) {
            AuthCubit.get(context).otpString = val;
            // log(AuthCubit.get(context).otpString);
          },
          onEditing: (val) {},
          keyboardType: TextInputType.number,
          fullBorder: true,
          underlineColor: Colors.transparent,
          underlineUnfocusedColor: Colors.transparent,
          fillColor: Colors.grey[200],
          digitsOnly: true,
          itemSize: 65,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          textStyle: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 30),
        Text(
          'Send me new code',
          style: TextStyle(color: AppColors.primary, fontSize: 16),
        ),
      ],
    );
  }
}
