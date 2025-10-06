import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/checkout/presentation/views/widgets/redeem_button.dart';
import 'package:gac/features/checkout/presentation/views/widgets/redeem_status_row.dart';
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
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (previous, current) =>
          current is DiscountSettingsLoadedState ||
          current is DiscountSettingsLoadingState ||
          current is PointsLoadingRedeemState ||
          current is PointsRedeemedState,
      builder: (context, state) {
        if (state is DiscountSettingsLoadingState ||
            state is PointsLoadingRedeemState) {
          return const Center(child: CustomAnimatedLoadingWidget());
        }

        if (state is! DiscountSettingsLoadedState) {
          return const SizedBox.shrink();
        }

        final settings = state.discountSettingsModel;

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
              trailing: RedeemButton(
                ordersCubit: ordersCubit,
                minPoints: settings.minPoints,
              ),
            ),
            RedeemStatusRow(
              ordersCubit: ordersCubit,
              minPoints: settings.minPoints,
              multiplier: settings.discount,
            ),
          ],
        );
      },
    );
  }
}


