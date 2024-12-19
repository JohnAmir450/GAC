import 'package:flutter/widgets.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
final List<ProductEntity>products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
         childAspectRatio:  0.50,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>   Padding(
        padding:  const EdgeInsets.all(8.0),
        child: ProductItem(productEntity: products[index],),
      ),
      
    );
  }
}