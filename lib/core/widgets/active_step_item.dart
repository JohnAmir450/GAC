import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 13,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,color: Colors.white,
          ),
        ),
        horizontalSpace(3),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}



