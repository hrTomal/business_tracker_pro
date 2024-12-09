import 'package:equatable/equatable.dart';

abstract class GetCompanyEvent extends Equatable {
  const GetCompanyEvent();

  @override
  List<Object?> get props => [];
}

class GetCompanyListRequested extends GetCompanyEvent {
  final int page;

  const GetCompanyListRequested({required this.page});

  @override
  List<Object?> get props => [page];
}
