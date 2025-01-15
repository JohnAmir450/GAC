import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_text_reach.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_orders_item.dart';

class ExpandedProductDetailsWidget extends StatelessWidget {
  const ExpandedProductDetailsWidget({
    super.key,
    required this.isExpanded,
    required this.isWideScreen,
    required this.widget,
  });

  final bool isExpanded;
  final bool isWideScreen;
  final UserOrdersItem widget;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isExpanded,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 32.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تفاصيل الطلب :',
                style: TextStyles.bold16
                    ),
            verticalSpace(8),
            ...widget.productDetails.map((product) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    CustomTextRich(
                      textLabel: 'اسم المنتج  :  ',
                      textValue: '${product.productName}  ',
                    ),
                    horizontalSpace(isWideScreen ? 64 : 32),
                    CustomTextRich(
                      textLabel: ' الكمية  :  ',
                      textValue: '${product.productQuantity}  ',
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
