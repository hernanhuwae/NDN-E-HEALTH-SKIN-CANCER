import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_bloc_firebase_1/model/userModel.dart';

class firestoreNdn {
  CollectionReference ndnDatabase =
      FirebaseFirestore.instance.collection('pengguna');

  Future<void> SetPengguna(UserModel thisPengguna) async {
    try {
      ndnDatabase.doc(thisPengguna.id).set({
        'email': thisPengguna.email,
        'password': thisPengguna.password,
        'kodeUnik': thisPengguna.kodeUnik,
        'username': thisPengguna.username,
      });
    } catch (e) {
      throw e;
    }
  }
}
