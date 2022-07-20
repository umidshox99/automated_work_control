class DeadlineData {
  String? day;
  int? count;

  DeadlineData({this.day, this.count});

  DeadlineData.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['count'] = this.count;
    return data;
  }
}