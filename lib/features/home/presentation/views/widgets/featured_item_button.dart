import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  final VoidCallback onNavigateToAllProducts;
  const FeaturedItemButton({super.key, required this.text, required this.onNavigateToAllProducts});
final String text;
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
        onPressed: (){
          onNavigateToAllProducts();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 4),
          child: Text(text,style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),),
        ),
      ),
    );
  }
}