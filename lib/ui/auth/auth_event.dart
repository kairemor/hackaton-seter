import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthRequested extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
