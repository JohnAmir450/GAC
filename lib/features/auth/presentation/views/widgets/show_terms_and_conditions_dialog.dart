import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_check_box.dart';
import 'package:gac/core/helper_functions/terms_and_conditions_widget_view.dart';
import 'package:gac/generated/l10n.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        horizontalSpace(16.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showTermsAndConditionsDialog(context);
            },
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text:  S.of(context).terms_accept,
                  style: TextStyles.semiBold13
                      .copyWith(color: const Color(0xff949D9E))),
              TextSpan(
                  text:  S.of(context).terms_and_conditions_sign,
                  style: TextStyles.semiBold13
                      .copyWith(color:  AppColors.lightPrimaryColor)),
            ])),
          ),
        )
      ],
    );
  }
}