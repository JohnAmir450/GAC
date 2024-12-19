import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';

class QuantityIndicator extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  final Color? color;
  const QuantityIndicator({super.key, required this.icon, this.onPressed, this.color=AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
