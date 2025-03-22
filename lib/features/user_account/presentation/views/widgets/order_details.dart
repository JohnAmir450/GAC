import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/foramted_date.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/generated/l10n.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.orderEntity,
  });

  final OrderModel orderEntity;

  @override
  Widget build(BuildContext context) {
    var locale= S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(8),
        Text(
          '${locale.total_order_cost}:   ${orderEntity.totalPrice.toStringAsFixed(2)} ${locale.pound}',
          style: TextStyles.bold16,
        ),
        verticalSpace(8),
        
        // User ID
        Text(
          '${locale.name}: ${orderEntity.shippingAddressModel.customerName}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        Text(
          '${locale.phone_number}: ${orderEntity.shippingAddressModel.customerPhone}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        Text(
          '${locale.order_date}: ${formatOrderDateFromTimestamp(orderEntity.orderDate)}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        // Shipping Address
          Text(
          '${locale.delivery_address}:',
          style: TextStyles.bold16,
        ),
        Text(
          orderEntity.shippingAddressModel.toString(),
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        
        // Payment Method
        Text(
          ' ${locale.payment_method}: ${orderEntity.payWithCash! ? locale.cash : locale.cash}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(16),
      ],
    );
  }
}

