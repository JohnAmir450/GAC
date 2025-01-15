import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/search_text_field.dart';
import 'package:gac/features/home/presentation/views/widgets/all_products_bloc_builder.dart';
import 'package:gac/features/home/presentation/views/widgets/products_view_header.dart';

class CategoryViewBody extends StatelessWidget {
  final String categoryName;
  const CategoryViewBody({super.key, required this.categoryName});

  @override
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextField(
                    controller: context.read<ProductsCubit>().searchController,
                    onChanged: (value) {
                      // Update search based on category
                      context.read<ProductsCubit>().searchProducts(
                            value,
                          );
                    },
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
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
        const AllProductsBlocBuilder()
      ],
    );
  }
}
