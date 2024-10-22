import 'dart:convert';

import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';

UserEntity getUserData() {
  var userEntity = UserEntity.fromJson(
      jsonDecode(CacheHelper.getData(key: kSaveUserDataKey)));
  return userEntity;
}