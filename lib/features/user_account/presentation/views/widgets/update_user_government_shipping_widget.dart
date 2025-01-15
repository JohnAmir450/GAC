import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/core/widgets/governemnt_selector.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';

class CustomGovernmentUpdateShippingSelector extends StatelessWidget {
  final Function(String) onSelected;
  const CustomGovernmentUpdateShippingSelector(
      {super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountManagerCubit, AccountManagerState>(
      builder: (context, state) {
        // Get the current government from the OrderEntity
        final currentGovernment =
            context.read<ShippingAddressEntity>().customerGovernment;
        String getHintText() {
          if (currentGovernment == ' ') {
            return 'اختر المحافظة';
          } else {
            return currentGovernment!;
          }
        }

        return GestureDetector(
          onTap: () {
            showGovernmentModal(
                context: context,
                options: governorates,
                onSelected: onSelected);
          },
          child: AbsorbPointer(
            child: CustomTextFormField(
              hintText: getHintText(),
              needsValidation: true, // Enable validation
              readOnly: true, // Prevent manual input
              validator: (value) {
                if (currentGovernment == null || currentGovernment == ' ') {
                  return 'يرجى اختيار المحافظة';
                }
                return null; // Validation passed
              },
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
          ),
        );
      },
    );
  }
}
