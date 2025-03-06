import 'dart:convert';

import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/services/shared_preferances_singleton.dart';
import 'package:fruit_e_commerce/features/auth/data/models/user_model.dart';
import 'package:fruit_e_commerce/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
