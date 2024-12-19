import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/models/product_model.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/get_products_stream_price.dart';
import 'package:gac/core/widgets/product_details_border.dart';

class ProductView extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductView({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => CartCubit(getIt.get<CartRepo>()),
        child: ProductViewBody(
          productEntity: productEntity,
        ),
      )),
    );
  }
}

class ProductViewBody extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductViewBody({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    List<ProductDetailedModel> details = [
      ProductDetailedModel(
          title: productEntity.expirationMonths == 12
              ? 'عام'
              : '${productEntity.expirationMonths} شهور',
          subtitle: 'الصلاحية',
          trailing: SvgPicture.asset(Assets.assetsImagesCalendar)),
      ProductDetailedModel(
          title: '100%',
          subtitle: 'اورجانيك',
          trailing: SvgPicture.asset(Assets.assetsImagesOrganicPicture)),
      ProductDetailedModel(
          title: '${productEntity.numberOfCalories} كالوري',
          subtitle: '100 جرام',
          trailing: SvgPicture.asset(Assets.assetsImagesCaloriesPicture)),
    ];
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if(state is AddToCartSuccessState){
          showSnackBar(context, text: 'تم اضافة المنتج للسلة بنجاح',color: AppColors.lightPrimaryColor);
        }else if (state is AddToCartFailureState){
          showSnackBar(context, text: state.errorMessage, );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  Assets.assetsImagesProductPageBackground,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Center(
                      child: Image.network(
                    productEntity.imageUrl!,
                    height: 350,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            verticalSpace(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.name,
                        style: TextStyles.bold23,
                      ),
                      verticalSpace(6),
                      GetProductStreamPrice(
                          cartCubit: cartCubit, productEntity: productEntity),
                      verticalSpace(16),
                      Text(
                        productEntity.description,
                        style: TextStyles.semiBold16
                            .copyWith(color: const Color(0xff979899)),
                      ),
                      verticalSpace(16),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.3 / 1,
                                  crossAxisSpacing: 6),
                          itemBuilder: (context, index) => ProductDetailsBorder(
                            productDetailedModel: details[index],
                          ),
                          itemCount: details.length,
                        ),
                      ),
                      verticalSpace(16),
                      CustomButton(
                          text: 'اضف الى السلة',
                          onPressed: () {
                            context.read<CartCubit>().addToCart(
                                cartModel: CartModel(
                                    productModel: ProductModel.fromEntity(
                                      productEntity,
                                    ),
                                    quantity: 1));
                          }),
                      verticalSpace(24),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
