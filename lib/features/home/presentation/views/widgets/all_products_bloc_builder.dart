import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/home/presentation/views/widgets/all_products_grid_view.dart';
import 'package:gac/features/home/presentation/views/widgets/empty_cart_view_widget.dart';

class AllProductsBlocBuilder extends StatelessWidget {
  const AllProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const SliverToBoxAdapter(child: CustomAnimatedLoadingWidget());
        } else if (state is ProductsSuccessState) {
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: EmptyListViewWidget(
                    title: 'لا توجد منتجات',
                    subTitle: 'سيتم إضافة منتجات قريباً'),
              ),
            );
          }
          return AllProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        }
        // Default case (if state is initial)
        return const SliverToBoxAdapter(
          child: Center(
            child: Text('لا يوجد منتجات لعرضها حاليا'),
          ),
        );
      },
    );
  }
}
