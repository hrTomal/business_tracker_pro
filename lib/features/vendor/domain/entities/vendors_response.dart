import 'package:business_tracker/features/common/domain/Address.dart';

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Vendor {
  bool? isActive;
  int? id;
  String? phone;
  String? logo;
  List<Address>? addresses;
  String? name;
  int? company;
  String? email;
  String? website;

  Vendor(
      {this.isActive,
      this.id,
      this.phone,
      this.logo,
      this.addresses,
      this.name,
      this.company,
      this.email,
      this.website});

  Vendor.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'];
    id = json['id'];
    phone = json['phone'];
    logo = json['logo'];
    if (json['addresses'] != null) {
      addresses = <Address>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Address.fromJson(v));
      });
    }
    name = json['name'];
    company = json['company'];
    email = json['email'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_active'] = this.isActive;
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['company'] = this.company;
    data['email'] = this.email;
    data['website'] = this.website;
    return data;
  }
}
