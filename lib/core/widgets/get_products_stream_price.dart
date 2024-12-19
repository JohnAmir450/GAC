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
  });

  final CartCubit cartCubit;
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
          return FittedBox(
            child: Text(priceFunction != null ?
              '${updatedPrice * priceFunction} جنية':'$updatedPrice  جنية',
              style:
                  TextStyles.bold16.copyWith(color: AppColors.secondaryColor),
            ),
          );
        } else {
          return const Text('Price unavailable');
        }
      },
    );
  }
}
