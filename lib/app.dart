import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/config/routes/app_routes.dart';
import 'package:task_i/features/SignUp/presentation/cubit/addphone_cubit.dart';
import 'package:task_i/features/onboarding/presentation/bloc/onboarding_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<AddphoneCubit>(create: (context) => AddphoneCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
