import 'package:gac/features/checkout/data/models/shipping_address_model.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';

import '../../domain/entities/checkout_product_details.dart';

class OrderModel {
  final String uID;
  final String orderDate;
  final double totalPrice;
  final bool? payWithCash;
 
  final String orderId;
  final ShippingAddressModel shippingAddressModel;
  final List<CheckoutProductDetails> checkoutProductDetailsList;

  OrderModel(
      {required this.uID,
      required this.orderDate,
      required this.totalPrice,
      required this.payWithCash,
   
      required this.orderId,
      required this.shippingAddressModel,
     required this.checkoutProductDetailsList
    });

    factory OrderModel.fromEntity(  OrderEntity orderEntity){
      return OrderModel(    
        uID: orderEntity.uID,
        orderDate: orderEntity.orderDate,
        totalPrice: orderEntity.totalPrice,
        payWithCash: orderEntity.payWithCash,    
         
        orderId: orderEntity.orderId,    
        shippingAddressModel: ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),    
       checkoutProductDetailsList: orderEntity.cartItems.map((e) => CheckoutProductDetails.fromEntity(e)).toList() 
 );   }
      toJson(){
        return {
          'uID': uID,
          'orderDate': orderDate,
          'totalPrice': totalPrice,
          'payWithCash': payWithCash,
          'orderStatus': 'جاري التأكيد',
          'orderId': orderId,
         'shippingAddressModel': shippingAddressModel.toJson(),
          'checkoutProductDetailsList': checkoutProductDetailsList.map((e) => e.toJson()).toList()
        };
      }
}
