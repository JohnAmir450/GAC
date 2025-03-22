import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/product/presentation/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductView({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CartCubit(getIt.get<CartRepo>()),
          ),
          BlocProvider(
            create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
          ),
        ],
        child: ProductViewBody(
          productEntity: productEntity,
        ),
      )),
    );
  }
}
