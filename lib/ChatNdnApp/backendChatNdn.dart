import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc_firebase_1/ChatNdnApp/model.dart';

class chatNdnService extends ChangeNotifier {
  final FirebaseAuth authChatNdn = FirebaseAuth.instance;
  final FirebaseFirestore databaseChatNdn = FirebaseFirestore.instance;

  //todo: Fungsi Kirim Pesan
  Future<void> kirimpesan(String getIdPenerima, String pesanChatNdn) async {
    //todo: get User info
    final String myUserIdNow = authChatNdn.currentUser!.uid;
    final String myUserEmailNow = authChatNdn.currentUser!.email.toString();
    final Timestamp waktuPesan = Timestamp.now();

    //todo: Buat pesan baru
    Message pesanBaruNdn = Message(
        pengirimId: myUserIdNow,
        pengirimMessage: myUserEmailNow,
        penerimaId: getIdPenerima,
        messageNdn: pesanChatNdn,
        timestampNdn: waktuPesan);

    //todo: Sorting chat room dari currentuser dan penerima id
    List<String> ids = [myUserIdNow, getIdPenerima];
    ids.sort();
    String chatRoomIdNdn = ids.join("_");

    //todo: Kirim Pesan baru ke database
    await databaseChatNdn
        .collection('chatndn')
        .doc(chatRoomIdNdn)
        .collection('pesanNdn')
        .add(pesanBaruNdn.toMap());
  }

  //todo: Menerima Pesan
  Stream<QuerySnapshot> getNdnAllMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomIdNdn = ids.join("_");

    return databaseChatNdn
        .collection('chatndn')
        .doc(chatRoomIdNdn)
        .collection('pesanNdn')
        .orderBy('timestampNdn', descending: false)
        .snapshots();
  }
}
