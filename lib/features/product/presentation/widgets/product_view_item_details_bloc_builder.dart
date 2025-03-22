import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/cubits/language/language_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_discount_widget.dart';
import 'package:gac/core/widgets/get_products_stream_price.dart';
import 'package:gac/core/widgets/product_details_border.dart';
import 'package:gac/generated/l10n.dart';

class ProductViewItemDetailsBlocBuilder extends StatelessWidget {
  const ProductViewItemDetailsBlocBuilder({
    super.key,
    required this.productEntity,
    required this.cartCubit,
    required this.details,
  });

  final ProductEntity productEntity;
  final CartCubit cartCubit;
  final List<ProductDetailedModel> details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.name,
                  style: TextStyles.bold23.copyWith(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? 24
                        : 22, // Adjust font size for larger screens
                  ),
                ),
                verticalSpace(6),
                Directionality(
                  textDirection: context
                              .read<LanguageCubit>()
                              .getCurrentLocale()
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: context
                              .read<LanguageCubit>()
                              .getCurrentLocale()
                              .languageCode ==
                          'ar'
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                    children: [
                      GetProductStreamPrice(
                        cartCubit: cartCubit,
                        productEntity: productEntity,
                        addedText: '/ ${S.of(context).carton}',
                      ),
                      horizontalSpace(8.w),
                      CustomDiscountWidget(
                        productEntity: productEntity,
                      ),
                    ],
                  ),
                ),
                verticalSpace(16),
                Text('وصف المنتج', style: TextStyles.bold16),
                verticalSpace(16),
                Text(
                  productEntity.description,
                  style: TextStyles.semiBold16
                      .copyWith(color: const Color(0xff979899)),
                ),
                verticalSpace(16),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600
                            ? 3
                            : 2, // 3 columns for larger screens
                        childAspectRatio: 2.3 / 1,
                        crossAxisSpacing: 6),
                    itemBuilder: (context, index) => ProductDetailsBorder(
                      productDetailedModel: details[index],
                    ),
                    itemCount: details.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
