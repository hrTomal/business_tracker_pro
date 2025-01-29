class VendorsResponse {
  int? count;
  String? next;
  String? previous;
  List<Vendor>? results;
  String? message;

  VendorsResponse(
      {this.count, this.next, this.previous, this.results, this.message});

  VendorsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Vendor>[];
      json['results'].forEach((v) {
        results!.add(new Vendor.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Vendor {
  String? phone;
  int? id;
  String? email;
  String? logo;
  bool? isActive;
  String? name;
  int? company;
  String? website;

  Vendor(
      {this.phone,
      this.id,
      this.email,
      this.logo,
      this.isActive,
      this.name,
      this.company,
      this.website});

  Vendor.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    id = json['id'];
    email = json['email'];
    logo = json['logo'];
    isActive = json['is_active'];
    name = json['name'];
    company = json['company'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['id'] = this.id;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['company'] = this.company;
    data['website'] = this.website;
    return data;
  }
}
