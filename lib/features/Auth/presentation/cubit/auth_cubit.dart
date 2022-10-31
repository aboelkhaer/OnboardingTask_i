import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_i/core/error/failures.dart';
import 'package:task_i/core/strings/failures.dart';
import 'package:task_i/features/Auth/domain/usecases/register_user.dart';
import 'package:task_i/features/Auth/domain/usecases/send_verification_code.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUserUseCase registerUserUseCase;
  final SendVerificationCodeUsecase sendVerificationCodeUsecase;
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CountryController? countryController = CountryController();
  bool doneVerification = false;
  bool otp = true;
  String otpString = '';
  int currentStep = 1;
  double hulfStep = 1.0;
  AuthCubit(
      {required this.registerUserUseCase,
      required this.sendVerificationCodeUsecase})
      : super(const ChangeStepState(currentStep: 1, hulfStep: 1.0));

  changeStepToForward() {
    if (hulfStep == 2.0) {}
    if (hulfStep == 1.5) {
      if (formKey.currentState!.validate()) {
        hulfStep = 2.0;
        currentStep = 2;
        emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      }
    }
    if (hulfStep == 1.0) {
      if (formKey.currentState!.validate()) {
        hulfStep = 1.5;
        emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      }
    }
  }

  changStepToBack() {
    if (hulfStep == 2.5) {
      hulfStep = 2.0;
      currentStep = 2;
      emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      return;
    }
    if (hulfStep == 2.0) {
      hulfStep = 1.5;
      currentStep = 2;
      emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      return;
    }
    if (hulfStep == 1.5) {
      hulfStep = 1.0;
      currentStep = 1;
      emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      return;
    }
  }

  registerUser() async {
    emit(LoadingUserDataState());
    final failureOrRegister = await registerUserUseCase();

    failureOrRegister.fold(
      (failure) => Fluttertoast.showToast(msg: _mapFailureToMessage(failure)),
      (register) => changeStepToForward(),
    );

    emit(LoadedUserDataState());
    emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
  }

  sendVerificationCode() async {
    emit(LoadingUserDataState());
    final failureOrSendVerificationCode =
        await sendVerificationCodeUsecase(otpString);

    failureOrSendVerificationCode.fold(
      (failure) => Fluttertoast.showToast(msg: _mapFailureToMessage(failure)),
      (done) {
        doneVerification = true;
        emit(OtpSuccessLoadingState());
        currentStep = 3;
        hulfStep = 2.5;
        Future.delayed(const Duration(seconds: 2));

        emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      },
    );
    emit(LoadedUserDataState());
    emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;

      case NotMatchVerificationCodeFailure:
        return verificationCodeNotMatchFailureMessage;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
