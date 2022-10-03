import 'package:flutter/material.dart';
import 'package:task_i/features/onboarding/presentation/widgets/onboarding_background.dart';
import '../widgets/onboarding_body.dart';
import '../widgets/onboarding_dots.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_header.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: const [
          OnboardingBackground(),
          OnboardingBody(),
          OnboardingDots(),
          OnboardingFooter(),
          OnboardingHeader(),
        ],
      ),
    );
  }
}
