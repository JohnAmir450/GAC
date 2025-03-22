import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/add_to_cart_botton_consumer.dart';
import 'package:gac/core/widgets/custom_cached_network_image.dart';
import 'package:gac/core/widgets/discount_price_text_span.dart';
import 'package:gac/core/widgets/price_text_span.dart';

class ProductItemDetails extends StatelessWidget {
  const ProductItemDetails({
    super.key,
    required this.itemWidth,
    required this.productEntity,
  });

  final double itemWidth;
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
   

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomCachedNetworkImageWidget(
              height: itemWidth,
              width: itemWidth * 0.8,
              fit: BoxFit.fill,
              imageUrl: productEntity.imageUrl!,
              borderRadius: 16,
            ),
          ),
          verticalSpace(8.h),
          Padding(
            padding: EdgeInsets.only(right: itemWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.name,
                  style: TextStyles.bold16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                PriceTextSpan(productEntity: productEntity),
                DiscountPriceTextSpan(productEntity: productEntity),
              ],
            ),
          ),
          verticalSpace(8.h),
          AddToCartButtonBlocConsumer(
              productEntity: productEntity, itemWidth: itemWidth),
        ],
      ),
    );
  }
}
