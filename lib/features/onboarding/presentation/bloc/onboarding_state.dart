part of 'onboarding_bloc.dart';

class ChangeOnboardingState extends Equatable {
  final int pageIndex;
  const ChangeOnboardingState({
    required this.pageIndex,
  });

  @override
  List<Object> get props => [pageIndex];
}
