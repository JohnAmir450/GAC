import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/models/product_model.dart';

final class CartModel {
  final ProductModel productModel;
  final int quantity;
  


  CartModel(
      {required this.productModel,
      required this.quantity,
      
      });
      factory CartModel.fromJson(Map<String, dynamic> json) {
  return CartModel(
      productModel: ProductModel.fromJson(json['productModel']),
      quantity: json['quantity'],
      
      );
}

factory CartModel.fromEntity(CartEntity entity) {
  return CartModel(
      productModel: ProductModel.fromEntity(entity.productEntity).toJson(),
      quantity: entity.quantity,
      
     );
}

toJson(){
  return {
    'productModel': productModel.toJson(),
    'quantity': quantity,
    
  };
}

CartEntity toEntity(){
  return CartEntity(
      productEntity: productModel.toEntity(),
      quantity: quantity,
      
     );
}
}
