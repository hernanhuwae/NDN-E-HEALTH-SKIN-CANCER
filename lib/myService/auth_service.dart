import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_bloc_firebase_1/model/userModel.dart';
import 'package:test_bloc_firebase_1/myService/firestore_service.dart';

class AuthServiceNdn {
  FirebaseAuth _ndnAuth = FirebaseAuth.instance;

  Future<UserModel> toDaftarNdn(
      {required String email,
      required String username,
      required String password,
      required String kodeUnik}) async {
    try {
      UserCredential penggunaKredensial = await _ndnAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel modelUser = UserModel(
          id: penggunaKredensial.user!.uid,
          email: email,
          username: username,
          password: password,
          kodeUnik: kodeUnik);

      await firestoreNdn().SetPengguna(modelUser);

      return modelUser;
    } catch (e) {
      throw e;
    }
  }
}
