import 'package:flutter/material.dart';
import 'package:gac/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:gac/features/checkout/presentation/views/widgets/review_order_section.dart';
import 'package:gac/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView(
      {super.key,
      required this.pageController,
      required this.formKey,
      required this.autoValidateMode,
      });
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: PageView.builder(
        controller: pageController,
        itemCount: getPages().length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => getPages()[index],
      ),
    );
  }

  List<Widget> getPages() => [
        const ShippingSection(),
        AddressInputSection(
          formKey: formKey,
          autoValidateMode: autoValidateMode,
         
        ),
        ReviewOrderSection(
          pageController: pageController,
        )
      ];
}
