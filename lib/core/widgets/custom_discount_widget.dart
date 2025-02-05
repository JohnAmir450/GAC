import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/products_entity.dart';

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
        padding:  EdgeInsets.only(right: rightPadding?? 8.w),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'خصم',
            style: TextStyle(
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
