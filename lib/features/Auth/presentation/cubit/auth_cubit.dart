import 'dart:convert';
import 'dart:developer';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_i/features/Auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:task_i/features/Auth/presentation/widgets/otp_success.dart';
import '../../../../core/error/exceptions.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
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
  UserModel? userModel;
  AuthCubit() : super(const ChangeStepState(currentStep: 1, hulfStep: 1.0));

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
    }
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

  registerUser() async {
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://circles-v2.codebase-tech.com/api/v2/actions/auth/send-verification-code'));
    request.bodyFields = {
      'mobile': '+201147877339',
      'mobile_country': 'EG',
      'fcm_token':
          'dWViIRtxTOaPoygCsOZLYJ:APA91bFnVq0wJHdZNhCgwQLsJPhoi37leMv1efwXUoC8JnLNtmIFdbTD6Y4Xhfg5w8MmRevwwxjh5Lj5TZEhzecE74Vv9lGt68T2ZNWFJjw_-QUr5JTbTQoINXXTKR6FC3bno5iMhs7M',
      'device': 'ios'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log(await response.stream.bytesToString());
      changeStepToForward();
    } else {
      log(response.reasonPhrase.toString());
    }
    emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
  }

  sendVerificationCode(context) async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://circles-v2.codebase-tech.com/api/v2/actions/auth/verify-code'));
    request.fields.addAll(
        {'otp': otpString, 'mobile': '+201147877339', 'mobile_country': 'EG'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final decodedMap = json.decode(responseString);
      log(decodedMap['code'].toString());
      if (decodedMap['code'] == 200) {
        doneVerification = true;
        emit(OtpSuccessLoadingState());
        currentStep = 3;
        hulfStep = 2.5;
        await Future.delayed(const Duration(seconds: 2));

        emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
      } else {
        Fluttertoast.showToast(msg: 'Verification code not match.');
      }
    } else {
      log(response.reasonPhrase.toString());
    }
    emit(ChangeStepState(currentStep: currentStep, hulfStep: hulfStep));
  }
}
