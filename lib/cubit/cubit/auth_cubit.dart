import 'package:test_bloc_firebase_1/cubit/cubit/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_bloc_firebase_1/model/userModel.dart';
import 'package:test_bloc_firebase_1/myService/auth_service.dart';

class AuthCubit extends Cubit<authState> {
  AuthCubit() : super(AuthInitial());

  void toDaftarNdn(
      {required String email,
      required String username,
      required String password,
      required String kodeUnik}) async {
    try {
      emit(AuthLoading());

      UserModel thisUser = await AuthServiceNdn().toDaftarNdn(
          email: email,
          username: username,
          password: password,
          kodeUnik: kodeUnik);

      emit(AuthSukses(thisUser));
    } catch (e) {
      emit(AuthGagal(ErrorNdn: e.toString()));
    }
  }
}
