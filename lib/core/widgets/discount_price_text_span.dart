import 'package:flutter/material.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class DiscountPriceTextSpan extends StatelessWidget {
  const DiscountPriceTextSpan({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: productEntity.discountPrice > 0,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  '${productEntity.discountPrice.toDouble()} جنيه/',
              style: TextStyles.bold13
                  .copyWith(color: AppColors.primaryColor),
            ),
            TextSpan(
              text: ' الكرتونة',
              style: TextStyles.semiBold13
                  .copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
