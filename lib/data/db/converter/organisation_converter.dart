import 'dart:convert';

import 'package:automated_work_control/data/model/user_model.dart';
import 'package:floor/floor.dart';

class OrganizationConverter extends TypeConverter<Organization?, String?> {
  @override
  Organization? decode(String? databaseValue) {
    return Organization.fromJson(
        databaseValue == null ? {} : jsonDecode(databaseValue));
  }

  @override
  String? encode(Organization? value) {
    return value == null ? null : jsonEncode(value.toJson());
  }
}
