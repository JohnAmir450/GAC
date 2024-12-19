import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/search_text_field.dart';
import 'package:gac/features/home/presentation/views/widgets/all_products_bloc_builder.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_all_products_app_bar.dart';
import 'package:gac/features/home/presentation/views/widgets/products_view_header.dart';

class AllProductsViewBody extends StatefulWidget {
  const AllProductsViewBody({super.key});

  @override
  State<AllProductsViewBody> createState() => _AllProductsViewBodyState();
}

class _AllProductsViewBodyState extends State<AllProductsViewBody> {
  @override
  initState() {
    context.read<ProductsCubit>().getProducts();
    context
        .read<ProductsCubit>()
        .searchProducts(context.read<ProductsCubit>().searchController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: context.read<ProductsCubit>().formKey,
              child: Column(
                children: [
                  const CustomApplicationAppBar(
                    title: 'المنتجات',
                  ),
                  verticalSpace(16),
                  SearchTextField(
                    controller: context.read<ProductsCubit>().searchController,
                    onChanged: (value) {
                      context.read<ProductsCubit>().searchProducts(value);
                    },
                  ),
                  verticalSpace(16),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      return ProductsViewHeader(
                        productLength: context.read<ProductsCubit>().productLength,
                      );
                    },
                  ),
                  verticalSpace(8),
                ],
              ),
            ),
          ),
        ),
        const AllProductsBlocBuilder()
      ],
    );
  }
}
