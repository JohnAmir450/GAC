import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/widgets/product_item.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.sizeOf(context).width > 600 ? 0.65 : 0.58;

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: aspectRatio,
        
       
        mainAxisSpacing: 8.0.h, 
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItem(
        productEntity: products[index],
      ),
    );
  }
}
