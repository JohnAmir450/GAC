import 'dart:io';

import 'package:gac/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String productCategory;
  final num price;
  final String description;
  final String productType;
  final String code;
  File? fileImage;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
   bool isOrganic=true;
  final int productQuantity;
  final num discountPrice;
   num avgRating=0;
   num ratingCount=0;
  final List<ReviewEntity>?reviews;

  ProductEntity({
    required this.discountPrice,
    required this.expirationMonths,
    required this.isOrganic,
    required this.productQuantity,
    required this.name,
    required this.price,
    required this.productCategory,
    required this.description,
    required this.productType,
    required this.code,
    this.fileImage,
    required this.isFeatured,
    this.imageUrl,
    required this.reviews,
  });
}