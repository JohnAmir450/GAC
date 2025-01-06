import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 12,
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.check,color: Colors.white,
          ),
        ),
        horizontalSpace(3),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color:  Colors.grey),
        )
      ],
    );
  }
}
