import 'package:flutter/material.dart';

class EmptyBestSellingProductsWidget extends StatelessWidget {
   final VoidCallback onNavigateToAllProducts;
  const EmptyBestSellingProductsWidget({
    super.key, required this.onNavigateToAllProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            const Text('لم يتم تحديد المنتجات الاكثر مبيعًا حتى الان '),
           TextButton(onPressed: (){
            onNavigateToAllProducts();
            
           }, child: const Text('تصفح جميع المنتجات'))
          ],
        ), 
      ),
    );
  }
}
