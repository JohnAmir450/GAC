import 'package:flutter/widgets.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/widgets/product_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
final List<ProductEntity>products;
  @override
  Widget build(BuildContext context) {
    double aspectRatio=MediaQuery.sizeOf(context).width>600 ? 0.68.h:0.53.h;
    return SliverGrid.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:  aspectRatio,
    
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>   Padding(
        padding:  const EdgeInsets.all(8.0),
        child: ProductItem(productEntity: products[index],),
      ),
      
    );
  }
}
