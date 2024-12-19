import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/home/presentation/views/widgets/all_products_view_body.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

 
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        child: const AllProductsViewBody(),
      ),
    );
  }
}

