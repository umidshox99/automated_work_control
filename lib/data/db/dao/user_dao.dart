import 'package:automated_work_control/data/model/user_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<int> insertUser(UserModel user);

  @delete
  Future<int> deleteUser(UserModel user);

  @Query("DELETE FROM UserModel")
  Future<void> clearUserTable();

  @Query("SELECT * FROM UserModel")
  Future<List<UserModel>> findAllUsers();
}
