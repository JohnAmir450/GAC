import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/features/home/manager/add_order/orders_cubit.dart';

import '../../../../../generated/l10n.dart';

class RedeemStatusRow extends StatelessWidget {
  const RedeemStatusRow({
    super.key,
    required this.ordersCubit,
    required this.minPoints,
    required this.multiplier,
  });

  final OrdersCubit ordersCubit;
  final int minPoints;
  final double multiplier;

  @override
  Widget build(BuildContext context) {
    final icon = ordersCubit.userPoints < minPoints
        ? Icons.warning_amber_rounded
        : ordersCubit.discount > 0
            ? Icons.check_circle
            : Icons.info_outline;

    final color = ordersCubit.userPoints < minPoints
        ? AppColors.secondaryColor
        : ordersCubit.discount > 0
            ? Colors.green
            : Colors.blue;

    final text = ordersCubit.isDiscountApplied
        ? S.of(context).discount_applied(ordersCubit.discount.toStringAsFixed(2))
        : ordersCubit.userPoints < minPoints
            ? S.of(context).min_points_required(minPoints.toString())
            : S.of(context).redeemable_discount(
                  (ordersCubit.userPoints * multiplier)
                      .roundToDouble()
                      .toString(),
                );

    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: color),
        ),
      ],
    );
  }
}
