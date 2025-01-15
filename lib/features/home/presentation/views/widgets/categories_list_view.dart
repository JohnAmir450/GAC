import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/features/home/presentation/views/widgets/all_products_view_body.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6.4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
           onTap: () {
          context.pushNamed(Routes.categoryView, arguments: categories[index]);
        },
          child: CustomProductCategoryItem(categoryName: categories[index],)),
        itemCount: categories.length,
      ),
    );
  }
}
