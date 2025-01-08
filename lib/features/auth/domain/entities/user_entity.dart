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

       UserEntity copyWith({
    String? name,
    String? secondName,
    String? phoneNumber,
    String? email,
    String? uId,
    List<CartEntity>? cartList,
    List<UserLocationsEntity>? userLocations,
  }) {
    return UserEntity(
      name: name ?? this.name,
      secondName: secondName ?? this.secondName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      uId: uId ?? this.uId,
      cartList: cartList ?? this.cartList,
      userLocations: userLocations ?? this.userLocations,
    );
  }
}
