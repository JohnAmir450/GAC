import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/home/presentation/views/manager/add_order/orders_cubit.dart';

import '../../../../../core/widgets/governemnt_selector.dart';

class CustomGovernmentSelector extends StatelessWidget {
  const CustomGovernmentSelector({super.key});

  @override
  

  @override
  Widget build(BuildContext context) {
    
    var currentGovernment = context
        .read<OrderEntity>()
        .shippingAddressEntity
        .customerGovernment;
        String getHintText() {
      if(currentGovernment==' '){
        return 'اختر المحافظة';
      }else{
        return currentGovernment!;
      }
    }
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: (){
             showGovernmentModal(
                context: context,
                options: governorates,
                onSelected: (value) {
                  // Update controller and OrderEntity state
                 
                   currentGovernment= value;
            
                  context
                      .read<OrderEntity>()
                      .shippingAddressEntity
                      .customerGovernment = value;
                  context.read<OrdersCubit>().changed();
                },
              );
            
          },
          child: AbsorbPointer(
            child: CustomTextFormField(
              
              hintText: getHintText()  ,
              needsValidation: true,
              readOnly: true,
              validator: (value) {
                if (currentGovernment == null || currentGovernment== ' ') {
                  return 'يرجى اختيار المحافظة';
                }
                return null;
              },
              suffixIcon: Icon(Icons.arrow_drop_down) 
              
            ),
          ),
        );
      },
    );
  }
}
