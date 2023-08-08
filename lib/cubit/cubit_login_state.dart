part of 'cubit_login_cubit.dart';

abstract class CubitLoginState extends Equatable {
  const CubitLoginState();

  @override
  List<Object> get props => [];
}

class CubitLoginInitial extends CubitLoginState {}

class AuthLoadingLogin extends CubitLoginState {}

class AuthSuksesLogin extends CubitLoginState {
  final UserLoginNdn myuser;
  AuthSuksesLogin(this.myuser);
  @override
  // TODO: implement props
  List<Object> get props => [myuser];
}

class AuthGagalLogin extends CubitLoginState {
  final String errorLoginNdn;

  AuthGagalLogin({required this.errorLoginNdn});

  @override
  List<Object> get props => [errorLoginNdn];
}
