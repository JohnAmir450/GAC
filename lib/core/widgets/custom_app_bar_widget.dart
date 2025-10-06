import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onTap;
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTap: onTap ?? () => context.pop(),
              child: Icon(icon ?? Icons.arrow_back_ios),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.bold19,
          ),
        ],
      ),
    );
  }
}