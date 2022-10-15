import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/core/utilities/colors.dart';
import 'package:task_i/features/SignUp/presentation/pages/auth_screen.dart';
import '../../data/datasources/onboarding_datasource.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<OnboardingBloc, ChangeOnboardingState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: (() => context
                      .read<OnboardingBloc>()
                      .pageController
                      .animateToPage(
                        onbordingData.length - 1,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.ease,
                      )),
                  child: Text(
                    state.pageIndex == onbordingData.length - 1 ? '' : 'Skip',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF333333),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
              width: 110,
              child: BlocBuilder<OnboardingBloc, ChangeOnboardingState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () => state.pageIndex != onbordingData.length - 1
                        ? context
                            .read<OnboardingBloc>()
                            .pageController
                            .animateToPage(
                                context.read<OnboardingBloc>().currentIndex + 1,
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.ease)
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPhoneScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    child: Text(
                      state.pageIndex == onbordingData.length - 1
                          ? 'Done'
                          : 'Next',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
