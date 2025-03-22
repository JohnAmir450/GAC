import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class CustomOrderSummaryRow extends StatelessWidget {
  const CustomOrderSummaryRow({
    super.key,
    required this.title,
    required this.leading,
  });

  final String title;
  final String leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Text(
          leading,
          style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
