import 'package:dartz/dartz.dart';
import 'package:task_i/core/error/failures.dart';
import 'package:task_i/features/Auth/domain/repositories/auth_repo.dart';

class RegisterUserUseCase {
  final AuthRepo authRepo;

  RegisterUserUseCase(this.authRepo);

  Future<Either<Failure, Unit>> call() async {
    return await authRepo.registerUser();
  }
}
