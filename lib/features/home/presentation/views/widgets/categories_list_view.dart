import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<ProductsCubit>();
    double width = MediaQuery.sizeOf(context).width>600? 5.3:4.3;
    return AspectRatio(
      aspectRatio: width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
           onTap: () {
          context.pushNamed(Routes.categoryView, arguments: cubit.categories[index].categoryName);
        },
          child: CustomProductCategoryItem(categoryImage: cubit.categories[index].image,categoryName: cubit.categories[index].categoryName,)),
        itemCount: cubit.categories.length,
      ),
    );
  }
  

}
