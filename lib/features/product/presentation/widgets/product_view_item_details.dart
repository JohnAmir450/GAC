import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_cached_network_image.dart';
import 'package:gac/features/product/presentation/widgets/product_view_item_details_bloc_builder.dart';

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
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: CustomCachedNetworkImageWidget(
                imageUrl: productEntity.imageUrl!,
                borderRadius: 16,
                height: MediaQuery.of(context).size.height * 0.47,
                fit: BoxFit.cover,
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
            ),
          ],
        ),
        verticalSpace(24),
        ProductViewItemDetailsBlocBuilder(productEntity: productEntity, cartCubit: cartCubit, details: details),
      ],
    );
  }
}

