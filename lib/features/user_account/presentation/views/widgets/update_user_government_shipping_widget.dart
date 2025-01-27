import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/widgets/custom_drop_down_form_field.dart';
import 'package:gac/core/widgets/governments_list.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';

class CustomGovernmentUpdateShippingSelector extends StatelessWidget {
  final Function(String) onSelected;
  const CustomGovernmentUpdateShippingSelector({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountManagerCubit, AccountManagerState>(
      builder: (context, state) {
        final currentGovernment = context.read<ShippingAddressEntity>().customerGovernment;

        return CustomDropDownButtonFormField(
          value: currentGovernment, // Bind the current value
          items: governments.map<DropdownMenuItem<String>>((gov) {
            return DropdownMenuItem<String>(
              value: gov,
              child: FittedBox(child: Text(gov)),
            );
          }).toList(), 
          onChanged: (value) {
            // Handle the selection change
            onSelected(value!);
          },
        );
      },
    );
  }
}
