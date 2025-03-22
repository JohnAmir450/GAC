import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/user_account/presentation/views/widgets/cancel_order_button.dart';
import 'package:gac/features/user_account/presentation/views/widgets/order_details.dart';
import 'package:gac/features/user_account/presentation/views/widgets/order_items_list_view.dart';
import 'package:gac/generated/l10n.dart';

class UserOrdersItem extends StatelessWidget {
  final OrderModel orderEntity;

  const UserOrdersItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    var locale=S.of(context);
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
                locale.order_number(orderEntity.orderId),
                style: TextStyles.bold16,
              ),
              verticalSpace(16),
              // Total Price
              Row(
                children: [
                   Text(
                    '${locale.current_order_status}:',
                    style: TextStyles.semiBold13,
                  ),
                  horizontalSpace(8),
                  Text(
                   _getLocalizedOrderStatus(context, orderEntity.orderStatus),
                    style: TextStyles.bold13
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  Flexible(child: CancelOrderButton(orderEntity: orderEntity))
                ],
              ),
              OrderDetails(orderEntity: orderEntity),

              // Order Products
                Text(
                '${S.of(context).order_items}:',
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
  String _getLocalizedOrderStatus(BuildContext context, String status) {
    var locale = S.of(context);
  switch (status) {
    case 'جاري التأكيد':
      return locale.in_progress;
    case 'تم التأكيد':
      return locale.order_confirmed_successfully;
    case 'تم الاستلام':
      return locale.delivered;
    case 'تم الإلغاء':
      return locale.cancelled;
      case 'خرج للتوصيل':
      return locale.out_for_delivery;
    default:
      return status; // Return original if not found
  }
}
}
