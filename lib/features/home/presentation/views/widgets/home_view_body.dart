import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_email_verfication_toast.dart';
import 'package:gac/features/home/domain/entities/featured_items_entity.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:gac/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  final VoidCallback onNavigateToAllProducts;
  const HomeViewBody({super.key, required this.onNavigateToAllProducts});

  @override
 

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              verticalSpace(8.h),
              const CustomEmailVerificationToast(),
              verticalSpace(8.h),
              const CustomHomeAppBar(),
              verticalSpace(12.h),
              FeaturedList(
                featuredItemsEntityList: featuredItemsEntityList,
                onNavigateToAllProducts: onNavigateToAllProducts,
              ),
              verticalSpace(16.h),
              BestSellingHeader(
                onNavigateToAllProducts: onNavigateToAllProducts,
              ),
              verticalSpace(8.h),
            ],
          ),
        ),
      ),
      BestSellingGridViewBlocBuilder(onNavigateToAllProducts:onNavigateToAllProducts ,)
    ]);
  }
}
