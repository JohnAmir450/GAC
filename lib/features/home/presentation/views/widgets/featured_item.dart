import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import '../domain/entities/featured_items_entity.dart';
import 'featured_item_button.dart';

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

    return Container(
      width: screenWidth * 0.9, // Adjust width to avoid overflow
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Assets.assetsImagesAppLogo,
                width: screenWidth * 0.4, // Reduce width for smaller screens
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: screenWidth * 0.5, // Dynamically adjust the width
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: Svg(Assets.assetsImagesFeaturedShape),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          featuredEntity.subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyles.semiBold13.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpace(6),
                      Flexible(
                        child: Text(
                          featuredEntity.title,
                          textAlign: TextAlign.center,
                          style: TextStyles.bold13.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpace(16),
                      FeaturedItemButton(
                        text: 'تسوق الان',
                        onNavigateToAllProducts: onNavigateToAllProducts,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
