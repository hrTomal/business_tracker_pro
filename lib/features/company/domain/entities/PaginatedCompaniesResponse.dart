import 'package:business_tracker/features/company/data/models/company.dart';

class PaginatedCompaniesResponse {
  int? count;
  String? next;
  String? previous;
  List<Company>? results;

  PaginatedCompaniesResponse(
      {this.count, this.next, this.previous, this.results});

  PaginatedCompaniesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Company>[];
      json['results'].forEach((v) {
        results!.add(Company.fromJson(v));
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
