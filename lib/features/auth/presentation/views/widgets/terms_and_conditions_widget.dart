import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_check_box.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(),
        horizontalSpace(16.w),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: 'من خلال إنشاء حساب فأنت توافق على ',
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xff949D9E))),
            TextSpan(
                text: 'الشروط والاحكام الخاصة بنا',
                style: TextStyles.semiBold13
                    .copyWith(color:  AppColors.lightPrimaryColor)),
          ])),
        )
      ],
    );
  }
}