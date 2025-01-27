import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/features/product/presentation/widgets/product_view_item_details.dart';

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
    ];
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          showSnackBar(context,
              text: 'تم اضافة المنتج للسلة بنجاح',
              color: AppColors.lightPrimaryColor);
        } else if (state is AddToCartFailureState) {
          showSnackBar(
            context,
            text: state.errorMessage,
          );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ProductViewItemDetails(productEntity: productEntity, cartCubit: cartCubit, details: details),
      ),
    );
  }
}

