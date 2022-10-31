import 'package:dartz/dartz.dart';
import 'package:task_i/core/error/failures.dart';
import 'package:task_i/features/Auth/domain/repositories/auth_repo.dart';

class SendVerificationCodeUsecase {
  final AuthRepo authRepo;

  SendVerificationCodeUsecase(this.authRepo);

  Future<Either<Failure, Unit>> call(String otpString) async {
    return await authRepo.sendVerificationCode(otpString);
  }
}
