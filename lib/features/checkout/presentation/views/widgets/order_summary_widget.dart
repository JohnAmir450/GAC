import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/redeem_user_points.dart';
import 'package:gac/features/home/presentation/views/manager/add_order/orders_cubit.dart';

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
            const Text(
              'ملخص الطلب : ',
              style: TextStyles.bold16,
            ),
            verticalSpace(12),
            ListTile(
              title: Text(
                'المبلغ الكلي',
                style: TextStyles.bold13,
              ),
              trailing: Text(
                '${orderEntity.totalPrice} جنيه',
                style: TextStyles.bold13,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              title: const Text(
                'التوصيل ',
                style: TextStyles.semiBold13,
              ),
              trailing: Text(
                ' مجاني',
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
            Row(
              children: [
                const Text(
                  'المجموع الكلي',
                  style: TextStyles.bold16,
                ),
                const Spacer(),
                Text(
                  '${(orderEntity.totalPrice - ordersCubit.discount).toStringAsFixed(2)} جنيه',
                  style:
                      TextStyles.bold16.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            verticalSpace(24),
          ],
        );
      },
    );
  }
}
