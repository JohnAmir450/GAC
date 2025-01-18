import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class CustomProductCategoryItem extends StatelessWidget {
  const CustomProductCategoryItem({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),

              blurRadius: 5,
              offset: const Offset(7, 2), // changes position of shadow
            ),
          ],
          color: const Color(0xffF3F5F9),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Text(categoryName,
            style: TextStyles.bold19.copyWith(color: AppColors.primaryColor)),
      ),
    );
  }
}
