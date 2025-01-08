import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/checkout/data/models/shipping_address_model.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:gac/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:gac/features/home/presentation/views/manager/add_order/orders_cubit.dart';


class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;
  int _currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> autoValidateMode =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    _pageController = PageController(initialPage: _currentStep);
    _pageController.addListener(() {
      setState(() {
        _currentStep = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    autoValidateMode.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    if (_currentStep < 3) {
      // Update based on the number of steps
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckoutSteps(
          currentStep: _currentStep,
          pageController: _pageController,
          formKey: _formKey,
        ),
        Expanded(
          child: CheckoutStepsPageView(
            pageController: _pageController,
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
          ),
        ),
        CustomButton(
            text: _currentStep == 2 ? "تأكيد الطلب" : "التالي",
            onPressed: () async {
              if (_currentStep == 1) {
                _handleAddressValidation();
                context.read<OrdersCubit>().updatePhoneNumberIfNeeded(context, context.read<OrderEntity>().shippingAddressEntity.customerPhone?? ' ');
              } else if (_currentStep == 2) {
                var orderEntity = context.read<OrderEntity>();
                context.read<OrdersCubit>().addOrder(orderEntity: orderEntity);
                saveUserLocationData(
                    shippingAddressModel: ShippingAddressModel.fromEntity(
                        orderEntity.shippingAddressEntity));
               
              } else {
                _goToNextStep();
              }
            }),
      ],
    );
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _goToNextStep();
    } else {
      autoValidateMode.value = AutovalidateMode.always;
    }
  }

  Future saveUserLocationData(
      {required ShippingAddressModel shippingAddressModel}) async {
    var userData = jsonEncode(ShippingAddressModel.fromEntity(
            context.read<OrderEntity>().shippingAddressEntity)
        .toJson());
    await CacheHelper.saveData(key: kSaveUserLocationKey, value: userData);
  }
}




