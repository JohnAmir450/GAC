import 'package:gac/core/entities/user_locations_entity.dart';

class UserLocationsModel {
  final String government;
  final String city;
  final String street;
  final String? locationDescription;

  UserLocationsModel({
    required this.government,
    required this.city,
    required this.street,
    this.locationDescription,
  });

  factory UserLocationsModel.fromJson(Map<String, dynamic> json) {
    return UserLocationsModel(
      government: json['government'],
      city: json['city'],
      street: json['street'],
      locationDescription: json['locationDescription'],
    );
  }

  factory UserLocationsModel.fromEntity(UserLocationsEntity userLocationsEntity) {
    return UserLocationsModel(
      government: userLocationsEntity.government,
      city: userLocationsEntity.city,
      street: userLocationsEntity.street,
      locationDescription: userLocationsEntity.locationDescription,
    );
  }

  UserLocationsEntity toEntity() {
    return UserLocationsEntity(
      government: government,
      city: city,
      street: street,
      locationDescription: locationDescription,
    );
  }
  toJson() {
    return {
      'government': government,
      'city': city,
      'street': street,
      'locationDescription': locationDescription,
    };
  }
}