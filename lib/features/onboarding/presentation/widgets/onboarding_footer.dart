import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      color: Colors.grey,
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
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
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