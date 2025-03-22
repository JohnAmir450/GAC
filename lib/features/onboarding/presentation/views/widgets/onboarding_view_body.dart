import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/onboarding/presentation/views/widgets/onboarding_background.dart';
import 'package:gac/features/onboarding/presentation/views/widgets/onboarding_title_and_subtitle_section.dart';
import 'package:gac/generated/l10n.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          const OnBoardingBackGround(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(Assets.assetsImagesAppLogo,height: 240.h,width: 240.w,)),
                verticalSpace(32.h),
                const TitleAndSubTitleSection(),
                const Spacer(
                  flex: 1,
                ),
                CustomButton(
                  height: isDeviceInPortrait(context) ? 54.h : 100.h,
                  text:  S.of(context).start_now, onPressed: () {
                  CacheHelper.saveData(key: kIsOnboardingViewKey, value: true);
                  context.pushNamedAndRemoveUntil(Routes.loginView, predicate: (Route<dynamic> route) => false);
                }),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

