part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class ChangeDotsEvent extends OnboardingEvent {
  final int pageIndex;
  const ChangeDotsEvent({
    required this.pageIndex,
  });
  @override
  List<Object> get props => [pageIndex];
}
