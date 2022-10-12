import 'package:flutter/material.dart';
import 'package:task_i/features/SignUp/presentation/pages/add_phone.dart';
import 'package:task_i/features/Splash/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:task_i/features/onboarding/presentation/pages/onboarding_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String addPhoneRoute = '/addPhone';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const AddPhoneScreen(),
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.addPhoneRoute:
        return MaterialPageRoute(
          builder: (context) => const AddPhoneScreen(),
        );

      default:
        return undefinedRoute();
    }
  }
}

Route<dynamic> undefinedRoute() {
  return MaterialPageRoute(
    builder: (context) => const Scaffold(
      body: Center(
        child: Text('No Screen Found'),
      ),
    ),
  );
}
