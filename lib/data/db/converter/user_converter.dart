import 'dart:convert';

import 'package:automated_work_control/data/model/user_model.dart';
import 'package:floor/floor.dart';

class UserConverter extends TypeConverter<User?, String?> {
  @override
  User? decode(String? databaseValue) {
    return User.fromJson(
        databaseValue == null ? {} : jsonDecode(databaseValue));
  }

  @override
  String? encode(User? value) {
    return value == null ? null : jsonEncode(value.toJson());
  }
}
