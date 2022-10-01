import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilities/scroll_effect.dart';
import '../../data/datasources/onboarding_datasource.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlow(),
      child: PageView.builder(
        onPageChanged: (page) {
          context.read<OnboardingBloc>().currentIndex = page;
          context.read<OnboardingBloc>().add(ChangeDotsEvent(pageIndex: page));
        },
        itemCount: onbordingData.length,
        controller: context.read<OnboardingBloc>().pageController,
        itemBuilder: ((contex, index) {
          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.17),
              Image.asset(
                onbordingData[index].image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.38,
                fit: BoxFit.contain,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                onbordingData[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          );
        }),
      ),
    );
  }
}
