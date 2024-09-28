import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String userName;

  const RegisterSubmitted(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.userName});

  @override
  List<Object?> get props => [email, password, firstName, lastName, userName];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  const RegisterEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  const RegisterPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}
