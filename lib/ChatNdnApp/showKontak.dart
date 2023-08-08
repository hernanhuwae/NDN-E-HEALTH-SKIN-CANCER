import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc_firebase_1/ChatNdnApp/chatNdn.dart';

class showKontak extends StatefulWidget {
  const showKontak({super.key});

  @override
  State<showKontak> createState() => _showKontakState();
}

class _showKontakState extends State<showKontak> {
  final kontakAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('kontak NDN'),
      ),
      body: listKontak(),
    );
  }

  //todo: Build semua list user didatabase
  Widget listKontak() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('pengguna').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('ERROR');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {}
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => kontakListItem(doc))
              .toList(),
        );
      },
    );
  }

  //todo: build single user daridatabase dari beberapa list
  Widget kontakListItem(DocumentSnapshot myDokumen) {
    Map<String, dynamic> dataNdnUserme =
        myDokumen.data()! as Map<String, dynamic>;

    if (kontakAuth.currentUser!.email != dataNdnUserme['email']) {
      return ListTile(
        title: Text(dataNdnUserme['email']),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => chatRoomNdn(
                      penerimaUserId: dataNdnUserme['username'],
                      penerimaUserEmail: dataNdnUserme['email'])));
        },
      );
    } else {
      return Container();
    }
  }
}
