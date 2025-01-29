import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/models/product_model.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_cached_network_image.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    // Get screen width dynamically
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Determine the width of a single item in the grid
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                 // width: itemWidth*0.9 , // Make the image responsive
                  height: itemWidth , // Maintain aspect ratio
                  child: CustomCachedNetworkImageWidget(fit: BoxFit.fill,
                    imageUrl: productEntity.imageUrl!,
                    borderRadius: 16,
                  ),
                ),
              ),
              verticalSpace(8.h),
              // Product Name and Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.name,
                    style: TextStyles.bold16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price.toDouble()} جنيه/',
                          style: TextStyles.bold13.copyWith(
                              color: AppColors.secondaryColor),
                        ),
                        TextSpan(
                          text: ' الكرتونة',
                          style: TextStyles.semiBold13.copyWith(
                              color: AppColors.lightSecondaryColor),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              verticalSpace(8.h),
              // Add to Cart Button
              Align(
                alignment: Alignment.centerRight,
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is AddToCartFailureState) {
                      showSnackBar(context, text: state.errorMessage);
                    } else if (state is AddToCartSuccessState) {
                      showSnackBar(
                        context,
                        text: 'تم اضافة المنتج للسلة بنجاح',
                        color: AppColors.lightPrimaryColor,
                      );
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        await context.read<CartCubit>().addToCart(
                              cartModel: CartModel(
                                productModel: ProductModel.fromEntity(productEntity),
                                quantity: 1,
                              ),
                            );
                      },
                      child: CircleAvatar(
                     
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          context.read<CartCubit>().productAddedToCart
                              ? Icons.check
                              : Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
