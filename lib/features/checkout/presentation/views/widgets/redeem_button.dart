import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/home/manager/add_order/orders_cubit.dart';
import 'package:gac/generated/l10n.dart';

class RedeemButton extends StatelessWidget {
  const RedeemButton({
    super.key,
    required this.ordersCubit,
    required this.minPoints,
  });

  final OrdersCubit ordersCubit;
  final int minPoints;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (_, state) =>
          state is PointsLoadingRedeemState || state is PointsRedeemedState,
      builder: (context, state) {
        return OutlinedButton(
          onPressed: () async {
            if (ordersCubit.userPoints >= minPoints) {
              await ordersCubit.redeemPointsForDiscount(
                userId: getUserData().uId,
              );
            } else if (ordersCubit.discount > 0) {
              showSnackBar(context, text: S.of(context).points_used);
            } else {
              showSnackBar(context, text: S.of(context).insufficient_points);
            }
          },
          child: state is PointsLoadingRedeemState
              ? const FittedBox(
                  child: CustomAnimatedLoadingWidget(size: 16),
                )
              : Text(
                  ordersCubit.isDiscountApplied
                      ? S.of(context).redeemed
                      : S.of(context).redeem,
                  style: TextStyles.semiBold16,
                ),
        );
      },
    );
  }
}
