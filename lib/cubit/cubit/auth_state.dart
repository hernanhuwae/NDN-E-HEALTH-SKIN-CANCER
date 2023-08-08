import 'package:equatable/equatable.dart';
import 'package:test_bloc_firebase_1/model/userModel.dart';

abstract class authState extends Equatable {
  const authState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends authState {}

class AuthLoading extends authState {}

class AuthSukses extends authState {
  final UserModel myUser;
  AuthSukses(this.myUser);
  @override
  List<Object?> get props => [myUser];
}

class AuthGagal extends authState {
  final String ErrorNdn;
  AuthGagal({required this.ErrorNdn});

  @override
  // TODO: implement props
  List<Object?> get props => [ErrorNdn];
}
