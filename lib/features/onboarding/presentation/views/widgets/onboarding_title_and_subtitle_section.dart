import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import '../../../../../core/utils/app_colors.dart';

class TitleAndSubTitleSection extends StatelessWidget {
  const TitleAndSubTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                 TextSpan(
                  text: 'مرحباً بك في \n',
                  style: TextStyles.bold23,
                ),
                TextSpan(
                  text: 'الشركة العربية الخليجية ',
                  style:
                      TextStyles.bold23.copyWith(color: AppColors.primaryColor),
                ),
              ])),
        ),
        verticalSpace(20.h),
        Text(
          'اكتشف تجربة جديدة مع الشركة العربية الخليجية. تسوق بسهولة، استكشف منتجات غذائية متنوعة، وتابع الأسعار مباشرة للحصول على أفضل العروض والجودة.',
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16.copyWith(color: const Color(0xff4E5556)),
        ),
      ],
    );
  }
}
