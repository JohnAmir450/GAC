import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/widgets/cart_item.dart';
import 'package:gac/generated/l10n.dart';


class CartProductsList extends StatelessWidget {
  final List<CartEntity> products;
  const CartProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index.isOdd) {
          
            return const Divider();
          }
         
          final productIndex = index ~/ 2; // Actual product index
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    context.read<CartCubit>().removeCartItem(
                        productCode: products[productIndex].productEntity.code);
                  },
                  icon: Icons.delete,
                  label: S.of(context).delete_product,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            child: CartItem(
              cartEntity: products[productIndex],
            ),
          );
        },
        childCount: products.length * 2 - 1, 
      ),
    );
  }
}
