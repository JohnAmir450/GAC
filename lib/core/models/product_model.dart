import 'dart:io';

import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/models/reveiew_model.dart';

class ProductModel {
  final String name;
  final num price;
  final String description;
  final String code;
  File? fileImage;
  final bool isFeatured;
  final String productCategory;
  final String productType;
  String? imageUrl;
  final int expirationMonths;
   bool isOrganic=true;
  final int productQuantity;
  final num discountPrice;
   num avgRating=0;
   num ratingCount=0;
  final List<ReviewModel>?reviews;
  final int? sellingCount;

  ProductModel( {
    required this.discountPrice,
    required this.expirationMonths,
    required this.isOrganic,
    required this.productCategory,
    required this.productQuantity,
    required this.name,
    required this.productType,
    required this.price,
    required this.description,
    required this.code,
    this.fileImage,
    required this.isFeatured,
    this.imageUrl,
    required this.reviews,
    this.sellingCount=0,
  });

  factory ProductModel.fromEntity( ProductEntity addProductEntity) {
    return ProductModel(
      name: addProductEntity.name,
      productCategory: addProductEntity.productCategory,    
      productType: addProductEntity.productType,
      price: addProductEntity.price,
      description: addProductEntity.description,
      code: addProductEntity.code,
      fileImage: addProductEntity.fileImage,  
      isFeatured: addProductEntity.isFeatured,
      imageUrl: addProductEntity.imageUrl,      
      expirationMonths: addProductEntity.expirationMonths,
      isOrganic: addProductEntity.isOrganic,
      productQuantity: addProductEntity.productQuantity,
      discountPrice: addProductEntity.discountPrice,
      reviews: addProductEntity.reviews?.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  } 

 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productType: json['productType'],
      productCategory: json['category'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      code: json['code'],
      fileImage: File(json['fileImage']),
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      productQuantity: json['productQuantity'],
      discountPrice: json['discountPrice'],
      reviews: (json['reviews'] as List<dynamic>?)
        ?.map((review) => ReviewModel.fromJson(review as Map<String, dynamic>))
        .toList() ?? [],
      sellingCount: json['sellingCount'],
    );
  }
  toJson(){
    return {
      'name': name,
      'price': price,
      'category': productCategory,
      'description': description,
      'code': code,
      'fileImage': fileImage!.path,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'productType': productType,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'productQuantity': productQuantity,
      'discountPrice': discountPrice,
      'reviews': reviews?.map((e) => e.toJson()).toList() as List<dynamic>,
      'sellingCount': sellingCount,
    };
  }


  ProductEntity toEntity(){
    return ProductEntity(
      name: name,    
      price: price,
      productCategory: productCategory,
      description: description,
      code: code,
      fileImage: fileImage,  
      productType: productType,
      isFeatured: isFeatured,
      imageUrl: imageUrl,      
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      productQuantity: productQuantity,
      discountPrice: discountPrice,
      reviews: reviews?.map((e) => e.toEntity()).toList()??[],
    );
  }
}