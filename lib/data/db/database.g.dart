// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserModel` (`dbId` INTEGER, `id` INTEGER, `username` TEXT, `cbId` INTEGER, `firstName` TEXT, `lastName` TEXT, `fatherName` TEXT, `isAdmin` INTEGER, `isUserActive` INTEGER, `color` TEXT, `gender` TEXT, `workNow` TEXT, `condition` TEXT, `tabNum` TEXT, `filial` TEXT, `deptCode` TEXT, `position` TEXT, `birthDate` TEXT, `phoneNumber` TEXT, `depName` TEXT, `depParentName` TEXT, `depParentCode` TEXT, `topLevelDept` TEXT, `role` TEXT, PRIMARY KEY (`dbId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'UserModel',
            (UserModel item) => <String, Object?>{
                  'dbId': item.dbId,
                  'id': item.id,
                  'username': item.username,
                  'cbId': item.cbId,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'fatherName': item.fatherName,
                  'isAdmin':
                      item.isAdmin == null ? null : (item.isAdmin! ? 1 : 0),
                  'isUserActive': item.isUserActive == null
                      ? null
                      : (item.isUserActive! ? 1 : 0),
                  'color': item.color,
                  'gender': item.gender,
                  'workNow': item.workNow,
                  'condition': item.condition,
                  'tabNum': item.tabNum,
                  'filial': item.filial,
                  'deptCode': item.deptCode,
                  'position': item.position,
                  'birthDate': item.birthDate,
                  'phoneNumber': item.phoneNumber,
                  'depName': item.depName,
                  'depParentName': item.depParentName,
                  'depParentCode': item.depParentCode,
                  'topLevelDept': item.topLevelDept,
                  'role': item.role
                }),
        _userModelDeletionAdapter = DeletionAdapter(
            database,
            'UserModel',
            ['dbId'],
            (UserModel item) => <String, Object?>{
                  'dbId': item.dbId,
                  'id': item.id,
                  'username': item.username,
                  'cbId': item.cbId,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'fatherName': item.fatherName,
                  'isAdmin':
                      item.isAdmin == null ? null : (item.isAdmin! ? 1 : 0),
                  'isUserActive': item.isUserActive == null
                      ? null
                      : (item.isUserActive! ? 1 : 0),
                  'color': item.color,
                  'gender': item.gender,
                  'workNow': item.workNow,
                  'condition': item.condition,
                  'tabNum': item.tabNum,
                  'filial': item.filial,
                  'deptCode': item.deptCode,
                  'position': item.position,
                  'birthDate': item.birthDate,
                  'phoneNumber': item.phoneNumber,
                  'depName': item.depName,
                  'depParentName': item.depParentName,
                  'depParentCode': item.depParentCode,
                  'topLevelDept': item.topLevelDept,
                  'role': item.role
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  final DeletionAdapter<UserModel> _userModelDeletionAdapter;

  @override
  Future<void> clearUserTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM UserModel');
  }

  @override
  Future<List<UserModel>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM UserModel',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            username: row['username'] as String?,
            cbId: row['cbId'] as int?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            fatherName: row['fatherName'] as String?,
            isAdmin:
                row['isAdmin'] == null ? null : (row['isAdmin'] as int) != 0,
            isUserActive: row['isUserActive'] == null
                ? null
                : (row['isUserActive'] as int) != 0,
            color: row['color'] as String?,
            gender: row['gender'] as String?,
            workNow: row['workNow'] as String?,
            condition: row['condition'] as String?,
            tabNum: row['tabNum'] as String?,
            filial: row['filial'] as String?,
            deptCode: row['deptCode'] as String?,
            position: row['position'] as String?,
            birthDate: row['birthDate'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            depName: row['depName'] as String?,
            depParentName: row['depParentName'] as String?,
            depParentCode: row['depParentCode'] as String?,
            topLevelDept: row['topLevelDept'] as String?,
            role: row['role'] as String?));
  }

  @override
  Future<int> insertUser(UserModel user) {
    return _userModelInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(UserModel user) {
    return _userModelDeletionAdapter.deleteAndReturnChangedRows(user);
  }
}

// ignore_for_file: unused_element
final _userConverter = UserConverter();
