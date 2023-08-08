import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc_firebase_1/myService/auth_login.dart';

import '../model/userLogin.dart';
part 'cubit_login_state.dart';

class CubitLoginCubit extends Cubit<CubitLoginState> {
  CubitLoginCubit() : super(CubitLoginInitial());

  void toLoginNdn(
      {required String emailControllerLogin,
      required String passwordControllerLogin}) async {
    emit(AuthLoadingLogin());

    UserLoginNdn thisUserLogin = await authLoginNdn().toLoginNdn(
        emailNdn: emailControllerLogin, passwordNdn: passwordControllerLogin);
  }
}
