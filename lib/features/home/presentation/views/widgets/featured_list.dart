import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/featured_items_entity.dart';
import 'featured_item.dart';

class FeaturedList extends StatelessWidget {
  final List<FeaturedItemsEntity> featuredItemsEntityList;
  final VoidCallback onNavigateToAllProducts;

  const FeaturedList({
    super.key,
    required this.featuredItemsEntityList,
    required this.onNavigateToAllProducts,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double aspectRatio = constraints.maxWidth > 600 ? 3.5 : 3.3;
        return CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) => FeaturedItem(
            featuredEntity: featuredItemsEntityList[index],
            onNavigateToAllProducts: onNavigateToAllProducts,
          ),
          itemCount: featuredItemsEntityList.length,
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,enlargeCenterPage: false,
            aspectRatio: aspectRatio,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            reverse: true,
          ),
        );
      },
    );
  }
}
