import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/foramted_date.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.orderEntity,
  });

  final OrderModel orderEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(8),
        Text(
          'اجمالي مبلغ الطلبية :   ${orderEntity.totalPrice.toStringAsFixed(2)} جنيه',
          style: TextStyles.bold16,
        ),
        verticalSpace(8),
        
        // User ID
        Text(
          'الاسم : ${orderEntity.shippingAddressModel.customerName}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        Text(
          'رقم الهاتف : ${orderEntity.shippingAddressModel.customerPhone}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        Text(
          '  تاريخ الطلب: ${formatOrderDateFromTimestamp(orderEntity.orderDate)}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        // Shipping Address
          Text(
          'عنوان التوصيل:',
          style: TextStyles.bold16,
        ),
        Text(
          orderEntity.shippingAddressModel.toString(),
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(8),
        
        // Payment Method
        Text(
          ' طريقة الدفع: ${orderEntity.payWithCash! ? 'نقدا' : 'نقدا'}',
          style: TextStyles.regular14.copyWith(color: Colors.grey),
        ),
        verticalSpace(16),
      ],
    );
  }
}

