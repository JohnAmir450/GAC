import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/widgets/custom_drop_down_form_field.dart';
import 'package:gac/core/widgets/governments_list.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/home/presentation/views/manager/add_order/orders_cubit.dart';

class CustomGovernmentSelector extends StatelessWidget {
  const CustomGovernmentSelector({super.key});

  @override
  Widget build(BuildContext context) {
    var currentGovernment =
        context.read<OrderEntity>().shippingAddressEntity.customerGovernment;

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return CustomDropDownButtonFormField(
          value: currentGovernment, // Bind the current value
          items: governments.map<DropdownMenuItem<String>>((gov) {
            return DropdownMenuItem<String>(
              value: gov,
              child: FittedBox(child: Text(gov)),
            );
          }).toList(),
          onChanged: (value) {
            currentGovernment = value;
            context
                .read<OrderEntity>()
                .shippingAddressEntity
                .customerGovernment = value;
            context.read<OrdersCubit>().changed();
          },
        );
      },
    );
  }
}
