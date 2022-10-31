import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/config/routes/app_routes.dart';
import 'package:task_i/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(create: (_) => sl<OnboardingBloc>()),
        BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
