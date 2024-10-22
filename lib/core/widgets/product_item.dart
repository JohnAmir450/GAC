import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (

      decoration: ShapeDecoration(
        color: const Color(0xff3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          
        ),
        ),
        child: Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              )),

            Column(
              children: [
                verticalSpace(16.h),
                Image.asset(Assets.assetsImagesTestImage,fit: BoxFit.fill,),
                 ListTile(
                    title: const Text(
                     'سمنة ماليزي',
                      style: TextStyles.bold16,
                    ),
                 subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '30 جنيه/',
                              style: TextStyles.bold13
                                  .copyWith(color: AppColors.secondaryColor)),
                          TextSpan(
                            text: ' الكيلو',
                            style: TextStyles.semiBold13
                                .copyWith(color: AppColors.lightSecondaryColor),
                          ),
                        ],
                      ),
                    ),
                    trailing: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
            )]    ),
          ],
        )
    ) ;
          
        
      
  }
}