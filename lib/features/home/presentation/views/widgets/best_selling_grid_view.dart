import 'package:flutter/widgets.dart';
import 'package:gac/core/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
         childAspectRatio: 163/230,
      ),
      itemCount: 10,
      itemBuilder: (context, index) =>  const Padding(
        padding:  EdgeInsets.all(8.0),
        child: ProductItem(),
      ),
      
    );
  }
}