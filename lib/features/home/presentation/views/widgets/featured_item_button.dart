import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: (){},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 4),
          child: Text('تسوق الان',style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),),
        ),
      ),
    );
  }
}