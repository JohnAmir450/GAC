import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/features/login/presentation/views/login_view.dart';
import 'package:gac/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:page_transition/page_transition.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.onBoardingView:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    
    case Routes.loginView:
      return PageTransition(
        duration: const Duration(milliseconds: 50),
        child: const LoginView(), type: PageTransitionType.fade);
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
