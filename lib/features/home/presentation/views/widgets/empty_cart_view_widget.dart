import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';

class EmptyCartViewWidget extends StatelessWidget {
  const EmptyCartViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpace(50),
        Center(child: SvgPicture.asset(Assets.assetsImagesEmptyCart)),
        const Text(
          'لا يوجد منتجات في سلة التسوق',
          style: TextStyles.bold19,
        ),
        verticalSpace(8),
        const Text(
          'يمكنك اضافة منتجات من القائمة',
          style: TextStyles.semiBold16,
        ),
      ],
    );
  }
}
