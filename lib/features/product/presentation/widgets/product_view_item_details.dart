import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/models/product_model.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/get_products_stream_price.dart';
import 'package:gac/core/widgets/product_details_border.dart';

class ProductViewItemDetails extends StatelessWidget {
  const ProductViewItemDetails({
    super.key,
    required this.productEntity,
    required this.cartCubit,
    required this.details,
  });

  final ProductEntity productEntity;
  final CartCubit cartCubit;
  final List<ProductDetailedModel> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            //
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                productEntity.imageUrl!,
                height: MediaQuery.of(context).size.height * 0.47,
                fit: BoxFit.cover, // Adjust the image scaling
              ),
            )),
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
                    style: TextStyles.bold23.copyWith(
                      fontSize: MediaQuery.of(context).size.width > 600
                          ? 24
                          : 22, // Adjust font size for larger screens
                    ),
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
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 600
                                      ? 3
                                      : 2, // 3 columns for larger screens
                              childAspectRatio: 2.3 / 1,
                              crossAxisSpacing: 6),
                      itemBuilder: (context, index) => ProductDetailsBorder(
                        productDetailedModel: details[index],
                      ),
                      itemCount: details.length,
                    ),
                  ),
                  verticalSpace(MediaQuery.of(context).size.height * 0.04),
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
    );
  }
}
