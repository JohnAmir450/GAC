import 'package:flutter/material.dart';
import 'package:gac/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OnBoardingViewBody()
    );
  }
}