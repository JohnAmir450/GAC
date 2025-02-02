import 'package:flutter/material.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class ProductDetailsBorder extends StatelessWidget {
  const ProductDetailsBorder({
    super.key,
    required this.productDetailedModel,
  });

  final ProductDetailedModel productDetailedModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff979899))),
        subtitle: Text(productDetailedModel.subtitle,maxLines: 1,),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(maxLines: 1,overflow: TextOverflow.ellipsis,productDetailedModel.title,style: TextStyles.bold16.copyWith(color: AppColors.primaryColor))),
        trailing: productDetailedModel.trailing,
      ),
    );
  }
}
