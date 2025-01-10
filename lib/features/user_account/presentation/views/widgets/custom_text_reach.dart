import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.textLabel,
    required this.textValue, this.textStyle,
  });
  final String textLabel;
  final String textValue;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context,) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: textLabel, style: TextStyles.semiBold16),
      TextSpan(text: textValue, style:textStyle?? TextStyles.bold16),
    ]));
  }
}
