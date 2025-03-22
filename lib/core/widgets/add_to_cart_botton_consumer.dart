import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/models/product_model.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/generated/l10n.dart';

class AddToCartButtonBlocConsumer extends StatelessWidget {
  const AddToCartButtonBlocConsumer({
    super.key,
    required this.productEntity,
    required this.itemWidth,
  });

  final ProductEntity productEntity;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartFailureState) {
          showSnackBar(context, text: state.errorMessage);
        } else if (state is AddToCartSuccessState) {
          showSnackBar(
            context,
            text: S.of(context).product_added_success,
            color: AppColors.lightPrimaryColor,
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await context.read<CartCubit>().addToCart(
              cartQuantity: 1,
                  cartModel: CartModel(
                    productModel:
                        ProductModel.fromEntity(productEntity),
                    quantity: 1,
                  ),
                );
          },
          child: Padding(
            padding: EdgeInsets.only(right: itemWidth * 0.08),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                context.read<CartCubit>().productAddedToCart
                    ? Icons.check
                    : Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}