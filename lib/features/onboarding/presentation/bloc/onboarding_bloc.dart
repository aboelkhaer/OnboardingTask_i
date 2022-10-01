import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, ChangeOnboardingState> {
  int currentIndex = 0;
  PageController pageController = PageController();
  OnboardingBloc() : super(const ChangeOnboardingState(pageIndex: 0)) {
    on<OnboardingEvent>((event, emit) {
      if (event is ChangeDotsEvent) {
        emit(ChangeOnboardingState(pageIndex: currentIndex));
      }
    });
  }
}
