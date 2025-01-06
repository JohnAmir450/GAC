import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.primaryColor,),borderRadius: BorderRadius.circular(16),
          )),
          child: ListTile(
            title: const Text(
              'الدفع عند الاستلام',
              style: TextStyles.bold16,
            ),
            subtitle: const Text(
              'التسليم في المكان المحدد',
              style: TextStyles.regular16,
            ),
            trailing: Text(
              '${context.read<OrderEntity>().totalPrice} جنيه',
              style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
            ),
            leading: const CircleAvatar(
              radius: 8,
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}