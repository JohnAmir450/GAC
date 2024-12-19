import 'package:firebase_auth/firebase_auth.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;
  List<CartModel> cartList;

  UserModel({required this.name, required this.email, required this.uId,required this.cartList });

  factory UserModel.fromFirebase(User user) {

    return  UserModel (
        name: user.displayName ?? '',
        email: user.email ?? '',
        uId: user.uid,
        cartList:  [],
        );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      cartList: (json['cartList'] as List<dynamic>?)
        ?.map((item) => CartModel.fromJson(item as Map<String, dynamic>))
        .toList() ?? [],
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uId: userEntity.uId,
      cartList: userEntity.cartList.map((e) => CartModel.fromEntity(e)).toList()
    );
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'cartList': cartList.map((e) => e.toJson()).toList() ,
    };
  }
 UserEntity toEntity(){
    return UserEntity(
      name: name,
      email: email,
      uId: uId,
      cartList: cartList.map((e) => e.toEntity()).toList()
    );
  }
}
