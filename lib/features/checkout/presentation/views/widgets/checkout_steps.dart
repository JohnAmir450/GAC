import 'package:flutter/material.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/features/checkout/presentation/views/widgets/step_item.dart';

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
                      showSnackBar(context, text: 'عليك ملء جميع البيانات');
                    }
                  }
                },
                child: StepItem(
                  text: getSteps()[index],
                  isActive: index <= _currentStep,
                ),
              ))),
    );
  }
}

List<String> getSteps() => [
      'طريقة الدفع ',
      'العنوان',
      'مراجعة الطلب',
    ];
