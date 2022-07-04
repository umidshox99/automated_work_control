import 'package:floor/floor.dart';

@entity
class UserModel {
  @primaryKey
  int? dbId;
  int? id;
  User? user;
  Organization? organization;
  String? phoneNumber;
  String? email;
  String? profileImageUrl;
  String? birthDate;
  String? pinCode;


  UserModel({this.id,
    this.user,
    this.organization,
    this.phoneNumber,
    this.email,
    this.profileImageUrl,
    this.pinCode,
    this.birthDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    organization = json['organization'] != null ? new Organization.fromJson(json['organization']) : null;
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    profileImageUrl = json['profileImageUrl'];
    birthDate = json['birthDate'];
    pinCode = json['pinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['profileImageUrl'] = this.profileImageUrl;
    data['pinCode'] = this.pinCode;
    data['birthDate'] = this.birthDate;
    return data;
  }
}

class Organization {
  int? id;
  String? name;

  Organization({this.id, this.name,});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class User {
  int? id;
  String? userName;
  String? lastName;
  String? firstName;
  String? middleName;

  User(
      {this.id, this.userName, this.lastName, this.firstName, this.middleName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    middleName = json['middleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    return data;
  }
}