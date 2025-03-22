import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/language/language_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/generated/l10n.dart';

class PriceTextSpan extends StatelessWidget {
  const PriceTextSpan({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Directionality(
      textDirection:
          context.read<LanguageCubit>().getCurrentLocale().languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: Text.rich(
        style: TextStyle(
          decorationThickness: 2,
          decorationColor: AppColors.lightSecondaryColor,
          decoration: productEntity.discountPrice > 0
              ? TextDecoration.lineThrough
              : null,
        ),
        TextSpan(
          children: [
            TextSpan(
              text: '${productEntity.price.toDouble()} ${locale.pound}/',
              style: TextStyles.bold13.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            TextSpan(
              text: locale.carton,
              style: TextStyles.semiBold13
                  .copyWith(color: AppColors.lightSecondaryColor),
            ),
          ],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
