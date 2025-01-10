import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
   final VoidCallback onNavigateToAllProducts;
  const BestSellingHeader({super.key, required this.onNavigateToAllProducts});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text(
        'الاكثر مبيعًا',style: TextStyles.bold16,
      ),
     
      GestureDetector(
        onTap: () {
        onNavigateToAllProducts();
        },
        child: Text(
          'المزيد',style: TextStyles.regular13.copyWith(color:const  Color(0xff949D9E)),
        ),
      ),
    ]);
  }
}