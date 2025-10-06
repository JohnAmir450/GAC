import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/services/analytics_service.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/features/home/presentation/views/widgets/category_view_body.dart';
import '../../../../../core/cubits/products_cubit/products_cubit.dart';


class CategoryView extends StatelessWidget {
  final String categoryName;
  const CategoryView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    AnalyticsService.logScreenView(screenName: 'CategoryView: $categoryName');
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>())
        ..getProducts(query: {
          'where': 'category', 
          'isEqualTo': categoryName,
        }),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: categoryName,
          onTap: () => context.pop(),
        ),
        body: SafeArea(
          child: CategoryViewBody(
            categoryName: categoryName,
          ),
        ),
      ),
    );
  }
}

