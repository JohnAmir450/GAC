import 'package:flutter/material.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/services/firebase_auth_service.dart';
import 'package:gac/features/auth/presentation/views/login_view.dart';
import 'package:gac/features/auth/presentation/views/reset_password_view.dart';
import 'package:gac/features/auth/presentation/views/signup_view.dart';
import 'package:gac/features/home/presentation/views/main_view.dart';
import 'package:gac/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:gac/features/product/presentation/views/product_view.dart';
import 'package:page_transition/page_transition.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.onBoardingView:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case Routes.loginView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const LoginView(),
          type: PageTransitionType.fade);
    case Routes.resetPasswordView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const ResetPasswordView(),
          type: PageTransitionType.fade);
    case Routes.signUpView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const SignUpView(),
          type: PageTransitionType.fade);
    case Routes.mainView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const MainView(),
          type: PageTransitionType.fade);

    case Routes.productView:
     var productEntity = settings.arguments as ProductEntity;
        return PageTransition(
          duration: const Duration(milliseconds: 50),
          child:  ProductView(productEntity: productEntity,),
          type: PageTransitionType.fade);
    default:
      var isLoggedIn = FirebaseAuthService().isLoggedIn();
      return PageTransition(
        duration: const Duration(milliseconds: 50),
        child: isLoggedIn ? const MainView() : const LoginView(),
        type: PageTransitionType.fade,
      );
  }
}
