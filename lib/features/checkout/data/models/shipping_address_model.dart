import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';

class ShippingAddressModel {
   String? customerName;
   String? customerPhone;
   String? customerEmail;
   String? customerGovernment;
   String? customerCity;
   String? customerStreetName;
   String? customerLocationDescription;

  ShippingAddressModel({
     this.customerName,
     this.customerPhone,
     this.customerEmail,
     this.customerGovernment,
     this.customerCity,
     this.customerStreetName,
    this.customerLocationDescription,
  });
  factory ShippingAddressModel.fromEntity(  ShippingAddressEntity shippingAddressEntity) {
      return  ShippingAddressModel(
        customerName: shippingAddressEntity.customerName,
        customerPhone: shippingAddressEntity.customerPhone,
        customerEmail: shippingAddressEntity.customerEmail,
        customerGovernment: shippingAddressEntity.customerGovernment,
        customerCity: shippingAddressEntity.customerCity,
        customerStreetName: shippingAddressEntity.customerStreetName,
        customerLocationDescription: shippingAddressEntity.customerLocationDescription
      );
  }
  @override
  String toString() {
    return '$customerGovernment, $customerCity, $customerStreetName,';
    
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      customerEmail: json['customerEmail'],
      customerGovernment: json['customerGovernment'],
      customerCity: json['customerCity'],
      customerStreetName: json['customerStreetName'],
      customerLocationDescription: json['customerLocationDescription']
    );
  }

  toJson(){
    return {
      'customerName': customerName ,
      'customerPhone': customerPhone,
      'customerEmail': customerEmail,
      'customerGovernment': customerGovernment ,
      'customerCity': customerCity,
      'customerStreetName': customerStreetName,
      'customerLocationDescription': customerLocationDescription
    };
  }
}
