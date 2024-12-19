import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/get_products_stream_price.dart';
import 'package:gac/core/widgets/quantity_bottom_sheet.dart';

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
        context.pushNamed(Routes.productView,arguments: cartEntity.productEntity);
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        verticalSpace(16.h),
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              height: MediaQuery.sizeOf(context).height * 0.15,
              cartEntity.productEntity.imageUrl!,
              fit: BoxFit.cover,
            )),
        horizontalSpace(18),
        FirstColumn(
          cartEntity: cartEntity,
        ),
        Spacer(),
        SecondColumn(
          cartEntity: cartEntity,
        ),
      ]),
    );
  }
}

class SecondColumn extends StatelessWidget {
  final CartEntity cartEntity;

  const SecondColumn({
    super.key,
    required this.cartEntity,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.13,
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

class FirstColumn extends StatelessWidget {
  final CartEntity cartEntity;
  const FirstColumn({
    super.key,
    required this.cartEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>()),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.14,
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartEntity.productEntity.name,
                  style: TextStyles.bold16,
                ),
                verticalSpace(12.h),
                Text(
                  '${cartEntity.quantity} كرتونة',
                  style: TextStyles.semiBold16
                      .copyWith(color: AppColors.secondaryColor),
                ),
                verticalSpace(12),
                Row(
                  children: [
                    OutlinedButton(
                      child: Text('الكمية : ${cartEntity.quantity}'),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (context) => QuantityBottomSheet(
                                  productCode: cartEntity.productEntity.code,
                                ));
                      },
                    ),
                    horizontalSpace(16),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
