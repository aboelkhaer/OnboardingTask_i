part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class ChangeStepState extends AuthState {
  final int currentStep;
  final double hulfStep;
  const ChangeStepState({
    required this.currentStep,
    required this.hulfStep,
  });
  @override
  List<Object> get props => [
        currentStep,
        hulfStep,
      ];
}

class OtpSuccessLoadingState extends AuthState {}

class OtpSuccessLoadedState extends AuthState {}

class LoadingUserDataState extends AuthState {}

class LoadedUserDataState extends AuthState {}
