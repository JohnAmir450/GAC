import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    print('width is : ${MediaQuery.sizeOf(context).width}');
    double aspectRatio = MediaQuery.sizeOf(context).width > 600 ? 0.65 : 0.56;
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.0.h,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItem(
        productEntity: products[index],
      ),
    );
  }
}
