class ResponseData<T> {
  int? count;
  String? next;
  String? previous;
  List<T>? results;

  ResponseData({this.count, this.next, this.previous, this.results});

  ResponseData.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic> json) fromJson) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <T>[];
      json['results'].forEach((v) {
        results!.add(fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJson) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => toJson(v)).toList();
    }
    return data;
  }
}
