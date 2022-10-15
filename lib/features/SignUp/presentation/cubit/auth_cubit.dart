import 'package:bloc/bloc.dart';
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
  AuthCubit() : super(const ChangeStepState(currentStep: 1));

  changeStepToForward() {
    if (currentStep == 2) {
      if (formKey.currentState!.validate()) {
        currentStep = 3;
        emit(ChangeStepState(currentStep: currentStep));
      }
    }
    if (currentStep == 1) {
      if (formKey.currentState!.validate()) {
        currentStep = 2;
        emit(ChangeStepState(currentStep: currentStep));
      }
    }
  }

  changStepToBack() {
    if (currentStep > 1) {
      currentStep = currentStep - 1;
      emit(ChangeStepState(currentStep: currentStep));
    }
  }
}
