class AttributeResponse {
  int? count;
  String? next;
  String? previous;
  List<Attribute>? results;

  AttributeResponse({this.count, this.next, this.previous, this.results});

  AttributeResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Attribute>[];
      json['results'].forEach((v) {
        results!.add(new Attribute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attribute {
  int? id;
  String? name;
  int? attributeType;
  bool? isActive;

  Attribute({this.id, this.name, this.attributeType, this.isActive});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    attributeType = json['attribute_type'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['attribute_type'] = this.attributeType;
    data['is_active'] = this.isActive;
    return data;
  }
}
