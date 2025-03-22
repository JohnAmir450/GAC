import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/language/language_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/generated/l10n.dart';

class DiscountPriceTextSpan extends StatelessWidget {
  const DiscountPriceTextSpan({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Visibility(
      visible: productEntity.discountPrice > 0,
      child: Directionality(
        textDirection:
            context.read<LanguageCubit>().getCurrentLocale().languageCode ==
                    'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    '${productEntity.discountPrice.toDouble()} ${locale.pound}/',
                style:
                    TextStyles.bold13.copyWith(color: AppColors.primaryColor),
              ),
              TextSpan(
                text: locale.carton,
                style: TextStyles.semiBold13
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
