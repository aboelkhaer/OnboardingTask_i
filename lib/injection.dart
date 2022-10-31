import 'package:get_it/get_it.dart';
import 'package:task_i/features/Auth/data/datasources/user_remote_data_source.dart';
import 'package:task_i/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:task_i/features/Auth/domain/repositories/auth_repo.dart';
import 'package:task_i/features/Auth/domain/usecases/register_user.dart';
import 'package:task_i/features/Auth/domain/usecases/send_verification_code.dart';
import 'package:task_i/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/onboarding/presentation/bloc/onboarding_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() =>
      AuthCubit(registerUserUseCase: sl(), sendVerificationCodeUsecase: sl()));
  sl.registerFactory(() => OnboardingBloc());

  // Usecases
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));

  sl.registerLazySingleton(() => SendVerificationCodeUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(userRemoteDataSource: sl()));

// Datasources

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());
}
