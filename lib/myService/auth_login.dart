import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_bloc_firebase_1/model/userLogin.dart';
import 'package:test_bloc_firebase_1/myService/firestore_serviceLogin.dart';

class authLoginNdn {
  FirebaseAuth _authLoginFirebase = FirebaseAuth.instance;
  Future<UserLoginNdn> toLoginNdn(
      {required String emailNdn, required String passwordNdn}) async {
    try {
      UserCredential thisKredensial = await _authLoginFirebase
          .signInWithEmailAndPassword(email: emailNdn, password: passwordNdn);

      UserLoginNdn passLogin = UserLoginNdn(
          id: thisKredensial.user!.uid,
          emailLogin: emailNdn,
          passwordLogin: passwordNdn);

      await firestoreLogin().setUserLogin(passLogin);

      return passLogin;
    } catch (e) {
      throw e;
    }
  }
}
