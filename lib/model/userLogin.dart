import 'package:equatable/equatable.dart';

class UserLoginNdn extends Equatable {
  final String id;
  final String emailLogin;
  final String passwordLogin;

  UserLoginNdn(
      {required this.emailLogin,
      required this.passwordLogin,
      required this.id});

  @override
  List<Object?> get props => [emailLogin, passwordLogin, id];
}
