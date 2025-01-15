import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/foramted_date.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_text_reach.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_orders_item.dart';

class MainOrderDetailsWidget extends StatelessWidget {
  const MainOrderDetailsWidget({
    super.key,
    required this.widget,
    required this.isWideScreen,
  });

  final UserOrdersItem widget;
  final bool isWideScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'رقم الطلب : ${widget.order.orderId}#',
          style: TextStyles.bold16
              .copyWith(fontSize: isWideScreen ? 18 : 16),
        ),
        verticalSpace(8),
        Text(
          'قيمة الطلب : ${widget.order.totalPrice} جنيه',
          style: TextStyles.bold13
              .copyWith(fontSize: isWideScreen ? 15 : 13),
        ),
        verticalSpace(8),
        Text(
          'تم الطلب يوم : ${formatOrderDate(widget.order.orderDate.toDate())}',
          style: TextStyles.semiBold16
              .copyWith(fontSize: isWideScreen ? 16 : 14),
        ),
        verticalSpace(8),
        CustomTextRich(
          textLabel: 'حالة الطلب : ',
          textValue: widget.order.orderStatus,
          textStyle: TextStyles.bold16.copyWith(
            color: AppColors.primaryColor,
            fontSize: isWideScreen ? 18 : 16,
          ),
        ),
        verticalSpace(12),
      ],
    );
  }
}
