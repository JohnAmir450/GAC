class UserLocationsEntity {
  final String government;
  final String city;
  final String street;
  final String? locationDescription;

  UserLocationsEntity({
    required this.government,
    required this.city,
    required this.street,
    this.locationDescription,
  });
}
