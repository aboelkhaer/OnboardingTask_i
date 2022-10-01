import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/onboarding_datasource.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 125,
      child: BlocBuilder<OnboardingBloc, ChangeOnboardingState>(
        builder: (context, state) {
          return DotsIndicator(
            dotsCount: onbordingData.length,
            position: state.pageIndex.toDouble(),
            decorator: DotsDecorator(
              activeColor: Colors.green[300],
              color: Colors.green.shade100,
              size: const Size(13.0, 5.0),
              activeSize: const Size(30.0, 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(width: 30)),
            ),
          );
        },
      ),
    );
  }
}
