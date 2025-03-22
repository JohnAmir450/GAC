import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import '../../../domain/entities/featured_items_entity.dart';

class FeaturedItem extends StatelessWidget {
  final VoidCallback onNavigateToAllProducts;
  final FeaturedItemsEntity featuredEntity;

  const FeaturedItem({
    super.key,
    required this.featuredEntity,
    required this.onNavigateToAllProducts,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.productTypes, arguments: featuredEntity.productType);
      },
      child: Container(
          width: screenWidth * 0.95, // Adjust width to avoid overflow
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(featuredEntity.image, fit: BoxFit.fitWidth),
          )),
    );
  }
}
