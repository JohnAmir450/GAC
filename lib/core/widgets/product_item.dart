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

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>())..getCartProducts(),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.productView, arguments: productEntity);
        },
        child: Container(
            decoration: ShapeDecoration(
              color: const Color(0xff3F5F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(children: [
              verticalSpace(16.h),
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    productEntity.imageUrl!,
                    fit: BoxFit.cover,
                  )),
              ListTile(
                  title: Text(
                    productEntity.name,
                    style: TextStyles.bold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${productEntity.price.toDouble()} جنيه/',
                            style: TextStyles.bold13
                                .copyWith(color: AppColors.secondaryColor)),
                        TextSpan(
                          text: ' الكرتونة',
                          style: TextStyles.semiBold13.copyWith(
                              color: AppColors.lightSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                  trailing: BlocConsumer<CartCubit, CartState>(
                    listener: (context, state) {
                      if (state is AddToCartFailureState) {
                        showSnackBar(context, text: state.errorMessage);
                      }
                      else if(state is AddToCartSuccessState){
                        showSnackBar(context, text: 'تم اضافة المنتج للسلة بنجاح',color: AppColors.lightPrimaryColor);
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().addToCart(
                              cartModel: CartModel(
                                  productModel: ProductModel.fromEntity(productEntity),
                                  quantity: 1,
                                  ));
                        },
                        child:  CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                          context.read<CartCubit>().productAddedToCart ? Icons.check :  Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ))
            ])),
      ),
    );
  }
}
