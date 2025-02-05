import 'package:flutter/material.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class PriceTextSpan extends StatelessWidget {
  const PriceTextSpan({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: TextStyle(
        decorationThickness: 2,
        decorationColor: AppColors.lightSecondaryColor,
        decoration: productEntity.discountPrice > 0
            ? TextDecoration.lineThrough
            : null,
      ),
      TextSpan(
        children: [
          TextSpan(
            text: '${productEntity.price.toDouble()} جنيه/',
            style: TextStyles.bold13.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          TextSpan(
            text: ' الكرتونة',
            style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightSecondaryColor),
          ),
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}