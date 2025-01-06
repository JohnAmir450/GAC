import 'package:gac/core/entities/cart_entity.dart';

class CheckoutProductDetails {
  final String code;
  final int quantity;

  CheckoutProductDetails({required this.code, required this.quantity});

  factory CheckoutProductDetails.fromEntity(CartEntity cartEntity) {
    return CheckoutProductDetails(
        code: cartEntity.productEntity.code, quantity: cartEntity.quantity);
  }

  toJson(){
    return {
      'code': code,
      'quantity': quantity
    };
  }
}
