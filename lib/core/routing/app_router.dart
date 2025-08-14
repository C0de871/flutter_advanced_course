import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart' show Routes;
import 'package:flutter_advanced_course/features/onBoarding/onboarding_screen.dart';

import '../../features/login/ui/login_screen.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
