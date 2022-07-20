class BirthdayData {
  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? color;
  String? position;
  String? cisco;
  String? filialName;
  String? avatar;
  String? normalizedCisco;
  String? condition;
  String? conditionName;
  String? topLevelDeptName;

  BirthdayData(
      {this.id,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.color,
      this.position,
      this.cisco,
      this.filialName,
      this.avatar,
      this.normalizedCisco,
      this.condition,
      this.conditionName,
      this.topLevelDeptName});

  BirthdayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    color = json['color'];
    position = json['position'];
    cisco = json['cisco'];
    filialName = json['filial_name'];
    avatar = json['avatar'];
    normalizedCisco = json['normalized_cisco'];
    condition = json['condition'];
    conditionName = json['condition_name'];
    topLevelDeptName = json['top_level_dept_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['color'] = this.color;
    data['position'] = this.position;
    data['cisco'] = this.cisco;
    data['filial_name'] = this.filialName;
    data['avatar'] = this.avatar;
    data['normalized_cisco'] = this.normalizedCisco;
    data['condition'] = this.condition;
    data['condition_name'] = this.conditionName;
    data['top_level_dept_name'] = this.topLevelDeptName;
    return data;
  }
}
