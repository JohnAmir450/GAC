import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';

class OrderEntity {
  final String uID;
  final Timestamp orderDate;
  final List<CartEntity> cartItems;
  final double totalPrice;
  final bool? payWithCash;
  final String orderStatus ;
  ShippingAddressEntity shippingAddressEntity ;
  final String orderId ;


OrderEntity copyWith({
  String? orderId,
  String? uID,
  String? orderStatus,
  Timestamp? orderDate,
  List<CartEntity>? cartItems,
  double? totalPrice,
  bool? payWithCash,
  ShippingAddressEntity? shippingAddressEntity  
})  {
    return OrderEntity(
      orderId: orderId ?? this.orderId,
      uID: uID ?? this.uID,
      orderStatus: orderStatus ?? this.orderStatus,
      orderDate: orderDate ?? this.orderDate,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      payWithCash: payWithCash ?? this.payWithCash,
      shippingAddressEntity: shippingAddressEntity ?? this.shippingAddressEntity
    );
}
  OrderEntity({
    required this.orderId,
    required this.uID,
    required this.orderStatus,
    required this.orderDate,
    required this.cartItems,
    required this.totalPrice,
    this.payWithCash = true,
    required this.shippingAddressEntity
  });

  
}
