import 'package:flutter/material.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class GetProductStreamPrice extends StatelessWidget {
  const GetProductStreamPrice({
    super.key,
    required this.cartCubit,
    required this.productEntity,
    this.priceFunction,
     this.addedText,
  });

  final CartCubit cartCubit;
  final String? addedText;
  final ProductEntity productEntity;
  final dynamic priceFunction;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: cartCubit.getProductPriceStream(productEntity.code),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error fetching price');
        } else if (snapshot.hasData) {
          final updatedPrice = snapshot.data!;
          final text=addedText ?? '';
          return FittedBox(
            child: Text(
              priceFunction != null
                  ? '${updatedPrice.roundToDouble() * priceFunction} جنيه'
                  : '${updatedPrice.roundToDouble()}  جنيه$text',
              style:
                  TextStyles.bold16.copyWith(color: AppColors.secondaryColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        } else {
          return const Text('Price unavailable');
        }
      },
    );
  }
}
