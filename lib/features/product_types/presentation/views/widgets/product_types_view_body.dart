import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/get_dummy_product.dart';
import 'package:gac/features/home/presentation/views/widgets/empty_cart_view_widget.dart';
import 'package:gac/features/product_types/manager/product_types/product_types_cubit.dart';
import 'package:gac/features/product_types/presentation/views/widgets/product_types_grid_view.dart';
import 'package:gac/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductTypesViewBody extends StatefulWidget {
  final String productType;
  
  const ProductTypesViewBody(
      {super.key,
      required this.productType,
      });

  @override
  State<ProductTypesViewBody> createState() => _ProductTypesViewBodyState();
}

class _ProductTypesViewBodyState extends State<ProductTypesViewBody> {
  @override
  void initState() {
    context
        .read<ProductTypesCubit>()
        .getProductsByType(categoryType: widget.productType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTypesCubit, ProductTypesState>(
      builder: (context, state) {
        if (state is GetProductByTypeLoadingState) {
          return Skeletonizer(
              enabled: true,
              child: GetProductByTypeGridView(
                products: getDummyProducts(),
              ));
        } else if (state is GetProductByTypeSuccessState) {
          if (state.products.isEmpty) {
            return  EmptyListViewWidget(
              title: S.of(context).there_is_no_products,
              subTitle: S.of(context).new_products_will_be_added,
            );
          } else {
            return GetProductByTypeGridView(products: state.products);
          }
        } else if (state is GetProductByTypeFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: Text('لا يوجد منتجات لعرضها حاليا'),
          );
        }
      },
    );
  }
}
