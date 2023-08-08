import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/userLogin.dart';

class firestoreLogin {
  CollectionReference loginNdnDatabase =
      FirebaseFirestore.instance.collection('pengguna');

  Future<void> setUserLogin(UserLoginNdn thisUserLogin) async {
    try {
      loginNdnDatabase.doc().set({
        'email': thisUserLogin.emailLogin,
        'password': thisUserLogin.passwordLogin,
      });
    } catch (e) {
      throw e;
    }
  }
}
