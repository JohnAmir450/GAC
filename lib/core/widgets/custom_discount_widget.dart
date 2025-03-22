import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/generated/l10n.dart';

class CustomDiscountWidget extends StatelessWidget {
  const CustomDiscountWidget({
    super.key,
    required this.productEntity, this.rightPadding,
  });
  final ProductEntity productEntity;
  final double? rightPadding;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: productEntity.discountPrice>0,
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: rightPadding?? 8.w),
        child: Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child:  Text(
            S.of(context).discount_title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
