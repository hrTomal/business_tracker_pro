class Brand {
  bool? isActive;
  String? name;
  int? id;
  int? company;
  String? image;

  Brand({this.isActive, this.name, this.id, this.company, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'];
    name = json['name'];
    id = json['id'];
    company = json['company'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['id'] = this.id;
    data['company'] = this.company;
    data['image'] = this.image;
    return data;
  }
}
