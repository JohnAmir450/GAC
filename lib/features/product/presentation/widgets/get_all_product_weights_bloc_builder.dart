import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/product_item.dart';
import 'package:gac/generated/l10n.dart';

class GetAllProductsWeightBlocBuilder extends StatefulWidget {
  const GetAllProductsWeightBlocBuilder({
    super.key,
    required this.productEntity,
    required this.itemHeight,
  });

  final ProductEntity productEntity;
  final double itemHeight;

  @override
  State<GetAllProductsWeightBlocBuilder> createState() =>
      _GetAllProductsWeightBlocBuilderState();
}

class _GetAllProductsWeightBlocBuilderState
    extends State<GetAllProductsWeightBlocBuilder> {
  @override
  void initState() {
    context.read<ProductsCubit>().getAllProductWeights(
        currentProductCode: widget.productEntity.code,
        whereConditions: [
          {
            'field': 'productType',
            'isEqualTo': widget.productEntity.productType,
          },
          {
            'field': 'category',
            'isEqualTo': widget.productEntity.productCategory,
          },
        ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !isDeviceInPortrait(context),
                    child: verticalSpace(24)),
                  Text(
                    '${S.of(context).various_products} ${widget.productEntity.productCategory}',
                    style: TextStyles.bold16
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  verticalSpace(16),
                  SizedBox(
                    height:isDeviceInPortrait(context)?  widget.itemHeight.h:widget.itemHeight.h*3,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            ProductItem(productEntity: state.products[index])),
                  ),
                ],
              ),
            );
          } else if (state is ProductsFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    });
  }
}
