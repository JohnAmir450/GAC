import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';

class EmptyListViewWidget extends StatelessWidget {
  const EmptyListViewWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(50),
          Center(child: SvgPicture.asset(Assets.assetsImagesEmptyCart)),
          Text(
            title,
            style: TextStyles.bold19,
          ),
          verticalSpace(8),
           Text(
            subTitle,
            style: TextStyles.semiBold16,
          ),
        ],
      ),
    );
  }
}
