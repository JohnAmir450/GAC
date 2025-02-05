import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/widgets/custom_discount_widget.dart';
import 'package:gac/core/widgets/product_item_datails.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = (screenWidth / 2) - 8.w; // Adjust based on spacing

    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>())..getCartProducts(),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.productView, arguments: productEntity);
        },
        child: Container(
          width: itemWidth, // Make the container fit its grid cell
          padding: EdgeInsets.all(12.h),
          decoration: ShapeDecoration(
            color: const Color(0xff3F5F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Stack(
            children: [
              ProductItemDetails(itemWidth: itemWidth, productEntity: productEntity),
              CustomDiscountWidget(
                productEntity: productEntity,
                rightPadding: isDeviceInPortrait(context)
                    ? itemWidth * 0.05
                    : itemWidth * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





