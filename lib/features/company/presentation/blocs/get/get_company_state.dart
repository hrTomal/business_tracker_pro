import 'package:business_tracker/features/company/data/models/company.dart';
import 'package:equatable/equatable.dart';

abstract class GetCompanyState extends Equatable {
  const GetCompanyState();

  @override
  List<Object?> get props => [];
}

class GetCompanyInitial extends GetCompanyState {}

class GetCompanyLoading extends GetCompanyState {}

class GetCompanyListSuccess extends GetCompanyState {
  final List<Company>? companies;
  final int count;
  final String? next;
  final String? previous;
  final int? selectedCompanyId;

  const GetCompanyListSuccess({
    required this.companies,
    required this.count,
    this.next,
    this.previous,
    this.selectedCompanyId,
  });

  GetCompanyListSuccess copyWith({
    List<Company>? companies,
    int? count,
    String? next,
    String? previous,
    int? selectedCompanyId,
  }) {
    return GetCompanyListSuccess(
      companies: companies ?? this.companies,
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      selectedCompanyId: selectedCompanyId ?? this.selectedCompanyId,
    );
  }

  @override
  List<Object?> get props => [
        companies ?? [],
        count,
        next ?? '',
        previous ?? '',
        selectedCompanyId ?? 0,
      ];
}

class GetCompanyFailure extends GetCompanyState {
  final String error;

  const GetCompanyFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
