class AttributeTypeResponse {
  int? count;
  String? next;
  String? previous;
  List<AttributeType>? results;

  AttributeTypeResponse({this.count, this.next, this.previous, this.results});

  AttributeTypeResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <AttributeType>[];
      json['results'].forEach((v) {
        results!.add(AttributeType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeType {
  int? id;
  String? name;
  int? company;
  bool? isActive;

  AttributeType({this.id, this.name, this.company, this.isActive});

  AttributeType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    company = json['company'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company'] = this.company;
    data['is_active'] = this.isActive;
    return data;
  }
}
