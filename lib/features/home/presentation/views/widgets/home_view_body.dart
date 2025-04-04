import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/home/domain/entities/featured_items_entity.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:gac/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  final VoidCallback onNavigateToAllProducts;
  const HomeViewBody({super.key, required this.onNavigateToAllProducts});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomHomeAppBar(),
              verticalSpace(12.h),
              FeaturedList(
                featuredItemsEntityList: featuredItemsEntityList,
                onNavigateToAllProducts: widget.onNavigateToAllProducts,
              ),
              verticalSpace(16.h),
              BestSellingHeader(
                onNavigateToAllProducts: widget.onNavigateToAllProducts,
              ),
              verticalSpace(8.h),
            ],
          ),
        ),
      ),
      BestSellingGridViewBlocBuilder(widget: widget)
    ]);
  }
}
