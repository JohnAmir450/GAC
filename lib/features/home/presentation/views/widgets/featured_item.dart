import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/home/presentation/views/domain/entities/featured_items_entity.dart';
import 'package:gac/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  final VoidCallback onNavigateToAllProducts;
  final FeaturedItemsEntity featuredEntity;
  const FeaturedItem({super.key,required this.featuredEntity, required this.onNavigateToAllProducts});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Assets.assetsImagesAppLogo,
                width: MediaQuery.sizeOf(context).width * 0.48,
                
              )),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                width: MediaQuery.sizeOf(context).width * 0.4,
                
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: Svg(
                    Assets.assetsImagesFeaturedShape,
                  ),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        featuredEntity.subTitle,textAlign: TextAlign.center,
                        style: TextStyles.semiBold13.copyWith(color: Colors.white),
                      ),
                      verticalSpace(6.h),
                      Text(
                       featuredEntity.title,textAlign: TextAlign.center,
                        style: TextStyles.bold16.copyWith(color: Colors.white),
                      ),
                      verticalSpace(8.h),
                      FeaturedItemButton(text: 'تسوق الان',onNavigateToAllProducts: onNavigateToAllProducts,)
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
