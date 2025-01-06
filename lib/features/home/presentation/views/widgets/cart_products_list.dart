import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/widgets/cart_item.dart';


class CartProductsList extends StatelessWidget {
  final List<CartEntity> products;
  const CartProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: ListView.separated(
          itemBuilder: ((context, index) {
            return Slidable(
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context) {
                    context.read<CartCubit>().removeCartItem(
                        productCode: products[index].productEntity.code);
                  },
                  icon: Icons.delete,
                  label: 'حذف المنتج',
                  backgroundColor: Colors.red,
                ),
              ]),
              child: CartItem(
                cartEntity: products[index],
              ),
            );
          }),
          separatorBuilder: ((context, index) => Divider()),
          itemCount: products.length),
    );
  }
}
