import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gac/features/checkout/data/models/shipping_address_model.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../domain/entities/checkout_product_details.dart';

class OrderModel {
  var pushId = OneSignal.User.pushSubscription.id.toString();
  final String uID;
  final Timestamp orderDate;
  final double totalPrice;
  final String orderStatus;
  final bool? payWithCash;
  final String orderId;
  final ShippingAddressModel shippingAddressModel;
  final List<CheckoutProductDetails> checkoutProductDetailsList;

  OrderModel(
      {required this.uID,
      required this.orderDate,
      required this.totalPrice,
      required this.payWithCash,
      this.orderStatus = 'جاري التأكيد',
      required this.orderId,
      required this.shippingAddressModel,
      required this.checkoutProductDetailsList});
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uID: json['uID'],
      orderDate: json['orderDate'],
      totalPrice: json['totalPrice'],
      payWithCash: json['payWithCash'] ?? true,
      orderStatus: json['orderStatus'],
      orderId: json['orderId'],
      shippingAddressModel:
          ShippingAddressModel.fromJson(json['shippingAddressModel']),
      checkoutProductDetailsList: (json['checkoutProductDetailsList']
              as List<dynamic>)
          .map(
              (e) => CheckoutProductDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
        uID: orderEntity.uID,
        orderDate: orderEntity.orderDate,
        totalPrice: orderEntity.totalPrice,
        payWithCash: orderEntity.payWithCash,
        orderId: orderEntity.orderId,
        shippingAddressModel:
            ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
        checkoutProductDetailsList: orderEntity.cartItems
            .map((e) => CheckoutProductDetails.fromEntity(e))
            .toList());
  }
  toJson() {
    return {
      'uID': uID,
      'orderDate': orderDate,
      'totalPrice': totalPrice,
      'payWithCash': payWithCash,
      'notificationId': pushId,
      'orderStatus': 'جاري التأكيد',
      'orderId': orderId,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'checkoutProductDetailsList':
          checkoutProductDetailsList.map((e) => e.toJson()).toList()
    };
  }
}
