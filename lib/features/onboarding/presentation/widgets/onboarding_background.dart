import 'package:flutter/material.dart';
import 'package:task_i/core/utilities/images.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        AppImages.bg,
        fit: BoxFit.fill,
      ),
    );
  }
}
