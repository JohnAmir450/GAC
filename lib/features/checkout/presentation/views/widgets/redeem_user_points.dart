import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/home/manager/add_order/orders_cubit.dart';
import 'package:gac/generated/l10n.dart';

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
            '${S.of(context).available_points} ${ordersCubit.userPoints}',
            style: TextStyles.semiBold16,
          ),
          trailing: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              return OutlinedButton(
                onPressed: () async {
                  if (ordersCubit.userPoints >= 1000) {
                    await ordersCubit.redeemPointsForDiscount(
                        userId: getUserData().uId);
                  } else if (ordersCubit.discount > 0) {
                    showSnackBar(context, text: S.of(context).points_used);
                  } else {
                    showSnackBar(context,
                        text: S.of(context).insufficient_points);
                  }
                },
                child: state is PointsLoadingRedeemState
                    ? const FittedBox(
                        child: CustomAnimatedLoadingWidget(
                        size: 16,
                      ))
                    : Text(
                        ordersCubit.isDiscountApplied
                            ? S.of(context).redeemed
                            : S.of(context).redeem,
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
                  ? S
                      .of(context)
                      .discount_applied(ordersCubit.discount.toStringAsFixed(2))
                  : ordersCubit.userPoints < 1000
                      ? S.of(context).min_points_required
                      : S.of(context).redeemable_discount(
                            (ordersCubit.userPoints * 0.02)
                                .roundToDouble()
                                .toString(),
                          ),
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
