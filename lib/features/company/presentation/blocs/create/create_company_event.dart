import 'package:equatable/equatable.dart';

abstract class CreateCompanyEvent extends Equatable {
  const CreateCompanyEvent();

  @override
  List<Object?> get props => [];
}

class CreateCompanySubmitted extends CreateCompanyEvent {
  final String companyName;
  final String addressLine1;
  final String addressLine2;

  const CreateCompanySubmitted(
      {required this.companyName,
      required this.addressLine1,
      required this.addressLine2});

  @override
  List<Object?> get props => [companyName, addressLine1, addressLine2];
}
