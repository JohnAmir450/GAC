import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productLength});
  final int productLength;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(
        ' $productLength نتائج',style: TextStyles.bold16,
      ),
     
      
    ]);
  }
}