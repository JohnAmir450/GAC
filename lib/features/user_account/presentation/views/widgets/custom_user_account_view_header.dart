import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';

import '../../../../../core/utils/spacing.dart';

class CustomUserAccountViewHeader extends StatelessWidget {
  const CustomUserAccountViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(Assets.assetsImagesProfilePicture),
          ),
          horizontalSpace(12),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(getUserData().name,style: TextStyles.bold16,),
                     verticalSpace(2),
                     Text(getUserData().email,style: TextStyles.regular16.copyWith(color: const Color(0xff949D9E)),),
                   ],
                 ),
      ],
    );
  }
}