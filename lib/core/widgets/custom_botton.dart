import 'package:flutter/material.dart';
import 'package:task_i/core/utilities/colors.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButtom({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.primary,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
