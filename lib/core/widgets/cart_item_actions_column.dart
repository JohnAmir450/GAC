import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/widgets/get_products_stream_price.dart';

class CartItemActionsColumn extends StatelessWidget {
  final CartEntity cartEntity;

  const CartItemActionsColumn({
    super.key,
    required this.cartEntity,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.grey),
            onPressed: () {
              context
                  .read<CartCubit>()
                  .removeCartItem(productCode: cartEntity.productEntity.code);
            },
          ),
          const Spacer(),
         
          GetProductStreamPrice(
            cartCubit: cartCubit,
            productEntity: cartEntity.productEntity,
            priceFunction: cartEntity.quantity,
          )
        ],
      ),
    );
  }
}
