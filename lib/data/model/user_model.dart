import 'package:floor/floor.dart';

@entity
class UserModel {
  @primaryKey
  int? dbId;
  int? id;
  String? username;
  int? cbId;
  String? firstName;
  String? lastName;
  String? fatherName;
  bool? isAdmin;
  bool? isUserActive;
  String? color;
  String? gender;
  String? workNow;
  String? condition;
  String? tabNum;
  String? filial;
  String? deptCode;
  String? position;
  String? birthDate;
  String? phoneNumber;
  String? depName;
  String? depParentName;
  String? depParentCode;
  String? topLevelDept;
  String? role;

  UserModel(
      {this.id,
      this.username,
      this.cbId,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.isAdmin,
      this.isUserActive,
      this.color,
      this.gender,
      this.workNow,
      this.condition,
      this.tabNum,
      this.filial,
      this.deptCode,
      this.position,
      this.birthDate,
      this.phoneNumber,
      this.depName,
      this.depParentName,
      this.depParentCode,
      this.topLevelDept,
      this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    cbId = json['cb_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    isAdmin = json['is_admin'];
    isUserActive = json['is_user_active'];
    color = json['color'];
    gender = json['gender'];
    workNow = json['work_now'];
    condition = json['condition'];
    tabNum = json['tab_num'];
    filial = json['filial'];
    deptCode = json['dept_code'];
    position = json['position'];
    birthDate = json['birth_date'];
    phoneNumber = json['phone_number'];
    depName = json['dep_name'];
    depParentName = json['dep_parent_name'];
    depParentCode = json['dep_parent_code'];
    topLevelDept = json['top_level_dept'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['cb_id'] = cbId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['is_admin'] = isAdmin;
    data['is_user_active'] = isUserActive;
    data['color'] = color;
    data['gender'] = gender;
    data['work_now'] = workNow;
    data['condition'] = condition;
    data['tab_num'] = tabNum;
    data['filial'] = filial;
    data['dept_code'] = deptCode;
    data['position'] = position;
    data['birth_date'] = birthDate;
    data['phone_number'] = phoneNumber;
    data['dep_name'] = depName;
    data['dep_parent_name'] = depParentName;
    data['dep_parent_code'] = depParentCode;
    data['top_level_dept'] = topLevelDept;
    data['role'] = role;
    return data;
  }
}
