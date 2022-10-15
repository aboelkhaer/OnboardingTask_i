import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CountryController countryController = CountryController();
  int currentStep = 1;
  double hulfStep = 1.0;
  AuthCubit() : super(const ChangeStepState(currentStep: 1, hulfStep: 1.0));

  changeStepToForward() {
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
    if (hulfStep == 2.0) {
      hulfStep = 1.5;
      currentStep = 2;
      emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
    }
    if (hulfStep == 1.5) {
      hulfStep = 1.0;
      currentStep = 1;
      emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
    }
  }
}
