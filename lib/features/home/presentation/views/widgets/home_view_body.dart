import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/search_text_field.dart';
import 'package:gac/features/home/presentation/views/domain/entities/featured_items_entity.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:gac/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:gac/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
        child:  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column (
        children: [
        const CustomHomeAppBar(),
        verticalSpace(16.h),
        const SearchTextField(),
        verticalSpace(16.h),
        FeaturedList(featuredItemsEntityList: featuredItemsEntityList),
        verticalSpace(12.h),
       const BestSellingHeader(),
        verticalSpace(16.h),
        
        ],
      ),
    
        ),
        ),
       const BestSellingGridView(),
      ]
    );
  }
}

