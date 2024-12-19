import 'dart:convert';

import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/features/auth/data/models/user_model.dart';

UserModel getUserData() {
  var userEntity = UserModel.fromJson(
      jsonDecode(CacheHelper.getData(key: kSaveUserDataKey)));
  return userEntity;
}