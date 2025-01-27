import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/widgets/product_item.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({super.key, required this.products});
final List<ProductEntity>products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
     
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:  0.6,
         crossAxisSpacing: 8.0.w, // Adjust horizontal spacing
        mainAxisSpacing: 8.0.h,
        
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>   Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 8.0),
        child: ProductItem(productEntity: products[index],),
      ),
      
    );
  }
}