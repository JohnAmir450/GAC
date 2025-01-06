import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/entities/user_locations_entity.dart';

class UserEntity {
  final String name;
  final String secondName;
  final String phoneNumber;
  final String email;
  final String uId;
  List<CartEntity> cartList;
  List<UserLocationsEntity>? userLocations;

  UserEntity(
      {required this.name,
      required this.secondName,
      required this.phoneNumber,
      required this.email,
      required this.uId,
     required  this.cartList,
     this.userLocations
     });
}
