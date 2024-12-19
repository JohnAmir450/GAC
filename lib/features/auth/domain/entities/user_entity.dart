import 'package:gac/core/entities/cart_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final String uId;
  List<CartEntity> cartList;

  UserEntity(
      {required this.name,
      required this.email,
      required this.uId,
     required  this.cartList});
}
