import 'package:task_i/core/error/exceptions.dart';
import 'package:task_i/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:task_i/features/Auth/data/datasources/user_remote_data_source.dart';
import 'package:task_i/features/Auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final UserRemoteDataSource userRemoteDataSource;
  AuthRepoImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> registerUser() async {
    try {
      await userRemoteDataSource.registerUser();
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendVerificationCode(String otpString) async {
    try {
      await userRemoteDataSource.sendVerificationCode(otpString);
      return const Right(unit);
    } on NotMatchVerificationCodeException {
      return Left(NotMatchVerificationCodeFailure());
    }
  }
}
