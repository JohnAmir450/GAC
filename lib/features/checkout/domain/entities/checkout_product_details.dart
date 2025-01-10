import 'package:gac/core/entities/cart_entity.dart';

class CheckoutProductDetails {
  final String productCode;
  final String productName;
  final String productImageUrl;
  final int productQuantity;

  CheckoutProductDetails({
    required this.productCode,
    required this.productQuantity,
    required this.productName,
    required this.productImageUrl,
  });

  factory CheckoutProductDetails.fromEntity(CartEntity cartEntity) {
    return CheckoutProductDetails(
      productCode: cartEntity.productEntity.code,
      productName: cartEntity.productEntity.name,
      productImageUrl: cartEntity.productEntity.imageUrl!,
      productQuantity: cartEntity.quantity,
    );
  }
  factory CheckoutProductDetails.fromJson(Map<String, dynamic> json) {
    return CheckoutProductDetails(
      productCode: json['code'],
      productName: json['name'],
      productImageUrl: json['imageUrl'],
      productQuantity: json['quantity'],
    );
  }
  toJson() {
    return {
      'code': productCode,
      'quantity': productQuantity,
      'name': productName,
      'imageUrl': productImageUrl,
    };
  }

}
