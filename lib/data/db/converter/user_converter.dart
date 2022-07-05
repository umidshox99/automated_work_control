import 'dart:convert';

import 'package:automated_work_control/data/model/user_model.dart';
import 'package:floor/floor.dart';

class UserConverter extends TypeConverter<UserModel?, String?> {
  @override
  UserModel? decode(String? databaseValue) {
    return UserModel.fromJson(
        databaseValue == null ? {} : jsonDecode(databaseValue));
  }

  @override
  String? encode(UserModel? value) {
    return value == null ? null : jsonEncode(value.toJson());
  }
}
