import 'package:firebase_auth/firebase_auth.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/models/user_locations_models.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String name;
  final String secondName;
   String phoneNumber;
  final String email;
  final String uId;
  List<CartModel> cartList;
  List<UserLocationsModel>? userLocations;
  final int points;

  UserModel(
     {
    required this.name,
    required this.email,
    required this.uId,
    required this.cartList,
    required this.phoneNumber, 
    required this.secondName,
    this.userLocations,
   required this.points,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      phoneNumber: user.phoneNumber ?? '',
      secondName: user.displayName?.split(' ')[1]??'',
      email: user.email ?? '',
      uId: user.uid,
      cartList: [],
      points: 0
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        secondName: json['secondName'],
        phoneNumber: json['phoneNumber'],
        points: json['points'],
        email: json['email'],
        uId: json['uId'],
        cartList: (json['cartList'] as List<dynamic>?)
                ?.map(
                    (item) => CartModel.fromJson(item as Map<String, dynamic>))
                .toList() ??
            [],
        userLocations: (json['userLocations'] as List<dynamic>?)
                ?.map((item) =>
                    UserLocationsModel.fromJson(item as Map<String, dynamic>))
                .toList() ??
            []);
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(

      name: userEntity.name,
      secondName: userEntity.secondName,
      phoneNumber: userEntity.phoneNumber,
      points: userEntity.points??0,
      email: userEntity.email,
      uId: userEntity.uId,
      cartList:
          userEntity.cartList?.map((e) => CartModel.fromEntity(e)).toList() ??[],
      userLocations: userEntity.userLocations
          ?.map((e) => UserLocationsModel.fromEntity(e))
          .toList(),
    );
  }

  toMap() {
    return {
      'name': name,
      'secondName': secondName,
      'phoneNumber': phoneNumber,
      'email': email,
      'uId': uId,
      'points': points,
      'cartList': cartList.map((e) => e.toJson()).toList(),
      'userLocations': userLocations?.map((e) => e.toJson()).toList()
    };
  }

  UserEntity toEntity() {
    return UserEntity(
        name: name,
        secondName: secondName,
        phoneNumber: phoneNumber,
        email: email,
        uId: uId,
        points: points,
        cartList: cartList.map((e) => e.toEntity()).toList(),
        userLocations: userLocations?.map((e) => e.toEntity()).toList());
  } 
  
   UserModel copyWith({
    String? name,
    String? secondName,
    String? phoneNumber,
    String? email,
    String? uId,
    List<CartModel>? cartList,
    List<UserLocationsModel>? userLocations,
    int? points,
  }) {
    return UserModel(
      name: name ?? this.name,
      secondName: secondName ?? this.secondName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      points: points ?? this.points,
      uId: uId ?? this.uId,
      cartList: cartList ?? this.cartList,
      userLocations: userLocations ?? this.userLocations,
    );
  }
}
