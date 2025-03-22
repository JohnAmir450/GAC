import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/generated/l10n.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin:  EdgeInsets.symmetric(vertical: 28.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.primaryColor,),borderRadius: BorderRadius.circular(16),
          )),
          child: ListTile(
            title:   Text(
             S.of(context).cash_on_delivery,
              style: TextStyles.bold16,
            ),
            subtitle:   Text(
             S.of(context).deliver_in_selected_address,
              style: TextStyles.regular16,
            ),
            trailing: Text(
              '${context.read<OrderEntity>().totalPrice} ${S.of(context).pound}',
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