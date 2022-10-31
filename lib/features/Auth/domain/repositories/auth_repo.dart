import 'package:dartz/dartz.dart';
import 'package:task_i/core/error/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> registerUser();
  Future<Either<Failure, Unit>> sendVerificationCode(String otpString);
}
