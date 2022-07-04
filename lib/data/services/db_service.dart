import 'package:automated_work_control/data/db/database.dart';
import 'package:automated_work_control/data/model/user_model.dart';
import 'package:get_it/get_it.dart';


class DBService {
  static DBService get to => GetIt.I<DBService>();

  static late AppDatabase _appDatabase;

  static Future init() async {
    GetIt.instance..registerSingleton<DBService>(DBService());
    await GetIt.I<DBService>().create();
  }

  Future create() async {
    _appDatabase =
    await $FloorAppDatabase.databaseBuilder('asaka.db').build();
  }

  // USER
  Future<int> saveUser(UserModel user) async {
    return await _appDatabase.userDao.insertUser(user);
  }

  Future<void> clearUser() async {
    return await _appDatabase.userDao.clearUserTable();
  }

  Future<UserModel?> getUser() async {
    final users = await _appDatabase.userDao.findAllUsers();
    if (users.isEmpty) return null;
    return users.first;
  }
}
