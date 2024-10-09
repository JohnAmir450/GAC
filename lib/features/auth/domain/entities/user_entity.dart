import 'package:firebase_auth/firebase_auth.dart';

class UserEntity{
  final String name;
  final String email;
  final String uId;

  
UserEntity({required this.name, required this.email, required this.uId});

factory UserEntity.fromFirebase(User user){
  return UserEntity(
    name: user.displayName?? '',
    email: user.email?? '',
    uId: user.uid,
  );
}
factory UserEntity.fromJson(Map<String, dynamic> json) {
  return UserEntity(
    name: json['name'],
    email: json['email'],
    uId: json['uId'],
  );
}
toMap() {
  return {
    'name': name,
    'email': email,
    'uId': uId,
  };
}
}