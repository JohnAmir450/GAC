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
