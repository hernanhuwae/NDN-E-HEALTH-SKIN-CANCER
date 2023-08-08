import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String password;
  final String kodeUnik;
  final String username;

  UserModel(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.kodeUnik});

  @override
  // TODO: implement props
  List<Object?> get props => [id, username, password, kodeUnik];
}
