import 'package:flutter/material.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:gac/generated/l10n.dart'; // Import localization

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required int currentStep,
    required this.pageController,
    required this.formKey,
  }) : _currentStep = currentStep;

  final int _currentStep;
  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        3, // Number of steps
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (_currentStep == 1) {
                if (formKey.currentState!.validate()) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  showSnackBar(context, text: S.of(context).fill_all_data);
                }
              }
            },
            child: StepItem(
              text: getSteps(context)[index], // Use localized text
              isActive: index <= _currentStep,
            ),
          ),
        ),
      ),
    );
  }
}

List<String> getSteps(BuildContext context) => [
      S.of(context).payment_method,
      S.of(context).address,
      S.of(context).review_order,
];
