import 'package:business_tracker/features/brands/domain/entities/Brand.dart';

class PaginatedBrandListResponse {
  int? count;
  String? next;
  String? previous;
  List<Brand>? results;
  String? message;

  PaginatedBrandListResponse(
      {this.count, this.next, this.previous, this.results, this.message});

  PaginatedBrandListResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Brand>[];
      json['results'].forEach((v) {
        results!.add(new Brand.fromJson(v));
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
