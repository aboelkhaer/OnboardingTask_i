import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:task_i/core/error/exceptions.dart';

abstract class UserRemoteDataSource {
  Future<Unit> registerUser();
  Future<Unit> sendVerificationCode(String otpString);
}

const baseUrl = 'http://circles-v2.codebase-tech.com/api/v2';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<Unit> registerUser() async {
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('$baseUrl/actions/auth/send-verification-code'));
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
      return Future.value(unit);
    } else {
      log(response.reasonPhrase.toString());
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendVerificationCode(String otpString) async {
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
        return Future.value(unit);
      } else {
        Fluttertoast.showToast(msg: 'Verification code not match.');
        throw NotMatchVerificationCodeException();
      }
    } else {
      log(response.reasonPhrase.toString());
      throw NotMatchVerificationCodeException();
    }
  }
}
