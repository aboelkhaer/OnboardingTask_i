import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task_i/core/error/exceptions.dart';
import 'package:task_i/features/Auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Unit> registerUser(UserModel userModel);
}

const baseUrl = 'http://circles-v2.codebase-tech.com/api/v2';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<Unit> registerUser(UserModel userModel) async {
    final response = await client.post(
        Uri.parse('$baseUrl/actions/auth/send-verification-code'),
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          'mobile',
          userModel.userPhone,
          'mobile_country',
          userModel.userCountryCode,
          'fcm_token',
          userModel.userToken,
          'device',
          userModel.userDevice,
        });

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
