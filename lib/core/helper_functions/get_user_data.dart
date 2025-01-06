import 'dart:convert';

import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/features/auth/data/models/user_model.dart';
import 'package:gac/features/checkout/data/models/shipping_address_model.dart';

UserModel getUserData() {
  var userEntity = UserModel.fromJson(
      jsonDecode(CacheHelper.getData(key: kSaveUserDataKey)));
  return userEntity;
}

ShippingAddressModel? getShippingAddress() {
  try {
    final data = CacheHelper.getData(key: kSaveUserLocationKey);
    if (data != null) {
      return ShippingAddressModel.fromJson(jsonDecode(data));
    }
    return null; // Return null if no data is found
  } catch (e) {
    // Handle any errors during decoding or parsing
    print('Error getting shipping address: $e');
    return null;
  }
}
