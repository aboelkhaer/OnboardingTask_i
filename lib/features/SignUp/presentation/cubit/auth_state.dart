part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class ChangeStepState extends AuthState {
  final int currentStep;
  const ChangeStepState({
    required this.currentStep,
  });
  @override
  List<Object> get props => [currentStep];
}
