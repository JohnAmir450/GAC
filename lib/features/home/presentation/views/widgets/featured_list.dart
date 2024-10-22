import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gac/features/home/presentation/views/widgets/featured_item.dart';

import '../domain/entities/featured_items_entity.dart';

class FeaturedList extends StatelessWidget {
  final List<FeaturedItemsEntity> featuredItemsEntityList ;
  const FeaturedList({super.key, required this.featuredItemsEntityList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemBuilder: (context, index, realIndex) =>  FeaturedItem(featuredEntity: featuredItemsEntityList[index],),
        itemCount: featuredItemsEntityList.length,
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          
          autoPlay: true,
          aspectRatio: 18 / 8,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          reverse: true,
        ));
  }
}