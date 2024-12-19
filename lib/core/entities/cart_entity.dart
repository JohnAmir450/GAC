import 'package:gac/core/entities/products_entity.dart';

final class CartEntity {
  final ProductEntity productEntity;
  final int quantity;
  
  CartEntity(
      {required this.productEntity,
      required this.quantity,
      
     });

     num calculateTotalPrice() {  
    return productEntity.price * quantity;
  }
 
}
