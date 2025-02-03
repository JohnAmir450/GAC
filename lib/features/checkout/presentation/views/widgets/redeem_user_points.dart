import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/home/presentation/views/manager/add_order/orders_cubit.dart';

class RedeemUserPoints extends StatelessWidget {
  const RedeemUserPoints({
    super.key,
    required this.ordersCubit,
  });

  final OrdersCubit ordersCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 40,
          thickness: 0.5,
          color: Color(0xffCACECE),
        ),
        ListTile(
          title: Text(
            'النقاط المتاحة : ${ordersCubit.userPoints}',
            style: TextStyles.semiBold16,
          ),
          trailing: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              return OutlinedButton(
                onPressed: () async {
                  if (ordersCubit.userPoints >= 1000) {
                    await ordersCubit.redeemPointsForDiscount(
                        userId: getUserData().uId);
                  } else {
                    showSnackBar(context, text: 'لا توجد نقاط كافية للاستخدام');
                  }
                },
                child: state is PointsLoadingRedeemState
                    ? const FittedBox(
                        child: CustomAnimatedLoadingWidget(
                        size: 16,
                      ))
                    : Text(
                        ordersCubit.isDiscountApplied
                            ? 'تم الاستخدام'
                            : 'استخدام',
                        style: TextStyles.semiBold16,
                      ),
              );
            },
          ),
        ),
        Row(
          children: [
            Icon(
              ordersCubit.userPoints < 1000
                  ? Icons.warning_amber_rounded
                  : ordersCubit.discount > 0
                      ? Icons.check_circle
                      : Icons.info_outline,
              color: ordersCubit.userPoints < 1000
                  ? AppColors.secondaryColor
                  : ordersCubit.discount > 0
                      ? Colors.green
                      : Colors.blue,
              size: 20,
            ),
            const SizedBox(width: 8), // Space between icon and text
            Text(
              ordersCubit.isDiscountApplied
                  ? 'تم خصم ${ordersCubit.discount.toStringAsFixed(2)} جنيه من النقاط '
                  : ordersCubit.userPoints < 1000
                      ? 'لا توجد نقاط كافية للاستخدام\n الحد الادني 1000 نقطة'
                      : 'يمكنك استخدام ${(ordersCubit.userPoints * 0.02).roundToDouble()} جنيه كخصم',
              style: TextStyles.semiBold13.copyWith(
                color: ordersCubit.userPoints < 1000
                    ? AppColors.secondaryColor
                    : ordersCubit.discount > 0
                        ? Colors.green
                        : Colors.blue,
              ),
            )
          ],
        ),
      ],
    );
  }
}
