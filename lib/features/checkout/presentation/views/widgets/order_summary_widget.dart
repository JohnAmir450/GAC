import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            Text(
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
            CustomOrderSummaryRow(
                title:ordersCubit.discount > 0 ? 'اجمالي الطلب' : 'المبلغ الكلي',
                leading: '${orderEntity.totalPrice.toStringAsFixed(2)} جنيه'),
            Visibility(
              visible: ordersCubit.discount > 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(6),
                  CustomOrderSummaryRow(
                      title: 'الخصم',
                      leading: '${ordersCubit.discount.roundToDouble()}- جنيه'),
                 const Divider(
                   height: 40,endIndent: 50,indent: 50,
                   thickness: 0.5,
                   color: Color(0xffCACECE),
                 ),
                  CustomOrderSummaryRow(
                      title:'المبلغ بعد الخصم',
                      leading:
                          '${(orderEntity.totalPrice - ordersCubit.discount).roundToDouble()} جنيه'),
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

class CustomOrderSummaryRow extends StatelessWidget {
  const CustomOrderSummaryRow({
    super.key,
    required this.title,
    required this.leading,
  });

  final String title;
  final String leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Text(
          leading,
          style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
