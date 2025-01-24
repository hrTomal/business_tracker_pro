class CategoryResponse {
  int? count;
  String? next;
  String? previous;
  List<CategoryInformation>? results;

  CategoryResponse({this.count, this.next, this.previous, this.results});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <CategoryInformation>[];
      json['results'].forEach((v) {
        results!.add(new CategoryInformation.fromJson(v));
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

class CategoryInformation {
  int? parent;
  int? id;
  String? image;
  bool? isActive;
  String? name;
  int? company;

  CategoryInformation(
      {this.parent,
      this.id,
      this.image,
      this.isActive,
      this.name,
      this.company});

  CategoryInformation.fromJson(Map<String, dynamic> json) {
    parent = json['parent'];
    id = json['id'];
    image = json['image'];
    isActive = json['is_active'];
    name = json['name'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent'] = this.parent;
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['company'] = this.company;
    return data;
  }
}
