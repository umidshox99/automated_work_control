import 'dart:async';
import 'package:automated_work_control/data/db/converter/organisation_converter.dart';
import 'package:automated_work_control/data/db/converter/user_converter.dart';
import 'package:automated_work_control/data/db/dao/user_dao.dart';
import 'package:automated_work_control/data/model/user_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@TypeConverters([
  UserConverter,
  OrganizationConverter,
])
@Database(version: 1, entities: [UserModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
