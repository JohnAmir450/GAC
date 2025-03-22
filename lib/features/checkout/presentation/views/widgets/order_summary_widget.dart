import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/custom_order_summary_row.dart';
import 'package:gac/features/checkout/presentation/views/widgets/redeem_user_points.dart';
import 'package:gac/features/home/manager/add_order/orders_cubit.dart';
import 'package:gac/generated/l10n.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        var ordersCubit = context.read<OrdersCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             S.of(context).order_summary,
              style: TextStyles.bold16,
            ),
            verticalSpace(12),
            ListTile(
              title: Text(
                S.of(context).total_amount,
                style: TextStyles.bold13,
              ),
              trailing: Text(
                '${orderEntity.totalPrice} ${ S.of(context).pound}',
                style: TextStyles.bold13,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              title:  Text(
                 S.of(context).delivery,
                style: TextStyles.semiBold13,
              ),
              trailing: Text(
                 S.of(context).free,
                style: TextStyles.semiBold13
                    .copyWith(color: AppColors.primaryColor),
              ),
              contentPadding: EdgeInsets.zero,
            ),
            RedeemUserPoints(ordersCubit: ordersCubit),
            const Divider(
              height: 40,
              thickness: 0.5,
              color: Color(0xffCACECE),
            ),
            CustomOrderSummaryRow(
                title:ordersCubit.discount > 0 ?  S.of(context).total_order :  S.of(context).total_amount,
                leading: '${orderEntity.totalPrice.toStringAsFixed(2)} ${ S.of(context).pound}'),
            Visibility(
              visible: ordersCubit.discount > 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(6),
                  CustomOrderSummaryRow(
                      title:  S.of(context).discount,
                      leading: '${ordersCubit.discount.roundToDouble()}- ${ S.of(context).pound}'),
                 const Divider(
                   height: 40,endIndent: 50,indent: 50,
                   thickness: 0.5,
                   color: Color(0xffCACECE),
                 ),
                  CustomOrderSummaryRow(
                      title: S.of(context).amount_after_discount,
                      leading:
                          '${(orderEntity.totalPrice - ordersCubit.discount).roundToDouble()} ${ S.of(context).pound}'),
                ],
              ),
            ),
            verticalSpace(24),
          ],
        );
      },
    );
  }
}

