import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/language/language_cubit.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/generated/l10n.dart';

class TitleAndSubTitleSection extends StatelessWidget {
  const TitleAndSubTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<LanguageCubit>();
    return Column(
      children: [
        Align(
            alignment: AlignmentDirectional.center,
            child:cubit.getCurrentLocale().languageCode =='ar'?Image.asset(Assets.assetsImagesGacName,height: 150.h,):Image.asset(Assets.assetsImagesEnglishAppName,height: 150.h,)),
        verticalSpace(20.h),
        Text(
          S.of(context).on_boarding_text,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16.copyWith(color: const Color(0xff4E5556)),
        ),
      ],
    );
  }
}
