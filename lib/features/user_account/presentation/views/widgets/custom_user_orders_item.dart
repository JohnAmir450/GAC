import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/user_account/presentation/views/widgets/cancel_order_button.dart';
import 'package:gac/features/user_account/presentation/views/widgets/order_details.dart';
import 'package:gac/features/user_account/presentation/views/widgets/order_items_list_view.dart';

class UserOrdersItem extends StatelessWidget {
  final OrderModel orderEntity;

  const UserOrdersItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
      child: Card(
        color: Colors.white,
        elevation: 4,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'رقم الطلب : ${orderEntity.orderId}# ',
                style: TextStyles.bold16,
              ),
              verticalSpace(16),
              // Total Price
              Row(
                children: [
                  const Text(
                    'حالة الطلبية:  ',
                    style: TextStyles.bold16,
                  ),
                  horizontalSpace(8),
                  Text(
                    orderEntity.orderStatus,
                    style: TextStyles.bold16
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  Flexible(child: CancelOrderButton(orderEntity: orderEntity))
                ],
              ),
              OrderDetails(orderEntity: orderEntity),

              // Order Products
              const Text(
                'الطلبية:',
                style: TextStyles.bold16,
              ),
              OrderItemsListView(orderEntity: orderEntity),
              verticalSpace(16)
            ],
          ),
        ),
      ),
    );
  }
}

