import 'package:task_i/features/Auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userPhone,
    required super.userName,
    required super.userCountryCode,
    required super.userDevice,
    required super.userToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'mobile': userPhone,
      'mobile_country': userCountryCode,
      'fcm_token': userToken,
      'device': userDevice,
    };
  }
}
