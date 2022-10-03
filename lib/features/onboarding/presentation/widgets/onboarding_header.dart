import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/core/utilities/images.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 10,
            left: 20,
            child: BlocBuilder<OnboardingBloc, ChangeOnboardingState>(
              builder: (context, state) {
                return state.pageIndex == 0
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () => context
                            .read<OnboardingBloc>()
                            .pageController
                            .animateToPage(
                              context.read<OnboardingBloc>().currentIndex - 1,
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.ease,
                            ),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        ),
                      );
              },
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.group,
                  width: 48.02,
                  height: 44,
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'circles',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'association',
                      style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
