import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/widgets/custom_cached_network_image.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/generated/l10n.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({
    super.key,
    required this.orderEntity,
  });

  final OrderModel orderEntity;

  @override
  Widget build(BuildContext context) {
    var locale=S.of(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderEntity.checkoutProductDetailsList.length,
      itemBuilder: (context, index) {
        final product = orderEntity.checkoutProductDetailsList[index];
        return ListTile(
          leading: CustomCachedNetworkImageWidget(
              borderRadius: 4, imageUrl: product.productImageUrl),
          title: Text(product.productName),
          subtitle: Text(
            '${locale.quantity} ${product.productQuantity} ${locale.carton}',
          ),
          trailing: Text(
            '  ${(product.productPrice * product.productQuantity).toDouble()} ${locale.pound}',
            style: TextStyles.regular14
                .copyWith(color: AppColors.primaryColor),
          ),
        );
      },
    );
  }
}
