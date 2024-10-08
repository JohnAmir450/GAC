import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: 'لديك حساب بالفعل؟ ',
        style: TextStyles.semiBold16
            .copyWith(color: const Color(0xff949D9E)),
      ),
      TextSpan(
        text: ' تسجيل الدخول',
        recognizer: TapGestureRecognizer()..onTap = () {
          context.pop();
        },
        style: TextStyles.bold16
            .copyWith(color: AppColors.primaryColor),
      ),
    ]));
  }
}