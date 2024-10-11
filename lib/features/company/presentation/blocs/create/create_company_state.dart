import 'package:equatable/equatable.dart';

abstract class CreateCompanyState extends Equatable {
  const CreateCompanyState();

  @override
  List<Object?> get props => [];
}

class CreateCompanyInitial extends CreateCompanyState {}

class CreateCompanyLoading extends CreateCompanyState {}

class CreateCompanySuccess extends CreateCompanyState {}

class CreateCompanyFailure extends CreateCompanyState {
  final String error;
  const CreateCompanyFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
