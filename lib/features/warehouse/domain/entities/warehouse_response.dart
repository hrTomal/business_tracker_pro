class WarehouseResponse {
  int? count;
  String? next;
  String? previous;
  List<Warehouse>? results;

  WarehouseResponse({this.count, this.next, this.previous, this.results});

  WarehouseResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Warehouse>[];
      json['results'].forEach((v) {
        results!.add(new Warehouse.fromJson(v));
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

class Warehouse {
  String? addressLine2;
  bool? isActive;
  int? division;
  String? addressLine1;
  int? company;
  int? district;
  String? name;
  int? id;

  Warehouse(
      {this.addressLine2,
      this.isActive,
      this.division,
      this.addressLine1,
      this.company,
      this.district,
      this.name,
      this.id});

  Warehouse.fromJson(Map<String, dynamic> json) {
    addressLine2 = json['address_line_2'];
    isActive = json['is_active'];
    division = json['division'];
    addressLine1 = json['address_line_1'];
    company = json['company'];
    district = json['district'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_line_2'] = this.addressLine2;
    data['is_active'] = this.isActive;
    data['division'] = this.division;
    data['address_line_1'] = this.addressLine1;
    data['company'] = this.company;
    data['district'] = this.district;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
