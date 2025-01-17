import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/cart_item_actions_column.dart';
import 'package:gac/core/widgets/cart_item_details_column.dart';

class CartItem extends StatelessWidget {
  final CartEntity cartEntity;
  const CartItem({
    super.key,
    required this.cartEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.productView,
            arguments: cartEntity.productEntity);
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          verticalSpace(16.h),
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                height: MediaQuery.sizeOf(context).height * 0.15,
                cartEntity.productEntity.imageUrl!,
                fit: BoxFit.cover,
              )),
          horizontalSpace(18),
          CartItemDetailsColumn(
            cartEntity: cartEntity,
          ),
          const Spacer(),
          CartItemActionsColumn(
            cartEntity: cartEntity,
          ),
        ]),
      ),
    );
  }
}
