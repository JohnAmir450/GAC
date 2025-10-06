import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/helper_functions/get_dummy_product.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:gac/features/home/presentation/views/widgets/empty_best_selling_products_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
    required this.onNavigateToAllProducts,
  });

  final VoidCallback onNavigateToAllProducts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) => current is ProductsLoadingState ||
          current is ProductsSuccessState ||
          current is ProductsFailureState,
      builder: (context, state) {
        if (state is ProductsLoadingState) {
    return  Skeletonizer.sliver(
      enabled: true,
      child: BestSellingGridView(products: getDummyProducts(),));
        } else if (state is ProductsSuccessState) {
    
         if(state.products.isEmpty){
     return   EmptyBestSellingProductsWidget(onNavigateToAllProducts:onNavigateToAllProducts ,);
         }else{
     return BestSellingGridView(products: state.products);
         }
        } else if (state is ProductsFailureState) {
    return  SliverToBoxAdapter(
      child: Center(
        child: Text(state.errorMessage),
      ),
    );
        }
    
      else {
    return const SliverToBoxAdapter(
    child: Center(
      child: Text('لا يوجد منتجات لعرضها حاليا'),
    ),
        );
      }
       
      
        
      },
    );
  }
}

