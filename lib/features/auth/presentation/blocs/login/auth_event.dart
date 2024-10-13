import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSubmitted extends AuthEvent {
  final String userIdentifier;
  final String password;

  const AuthSubmitted({
    required this.userIdentifier,
    required this.password,
  });

  @override
  List<Object?> get props => [userIdentifier, password];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();

  @override
  List<Object?> get props => [];
}
