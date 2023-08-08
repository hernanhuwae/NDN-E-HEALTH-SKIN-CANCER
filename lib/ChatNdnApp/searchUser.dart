import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc_firebase_1/ChatNdnApp/chatNdn.dart';

import 'package:test_bloc_firebase_1/Reusable/tombol.dart';

class SearchHomeChatNdn extends StatefulWidget {
  const SearchHomeChatNdn({super.key});

  @override
  State<SearchHomeChatNdn> createState() => _SearchHomeChatNdnState();
}

class _SearchHomeChatNdnState extends State<SearchHomeChatNdn> {
  Map<String, dynamic>? listKontak;
  final TextEditingController _mysearchController = TextEditingController();

  //todo: Fungsi Cari Kontak

  void searchKontak() async {
    final authsearch = FirebaseFirestore.instance;

    await authsearch
        .collection('pengguna')
        .where('email', isEqualTo: _mysearchController.text)
        .get()
        .then((value) {
      setState(() {
        listKontak = value.docs[0].data();
      });
      print(listKontak);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03265B),
        centerTitle: true,
        title: Text(
          'Chatting NDN',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFC045)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Container(
                child: TextField(
                  controller: _mysearchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(
                        'Cari Kontak',
                        textAlign: TextAlign.center,
                      )),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          myTombol(
              teksTombol: 'CARI',
              tekan: () {
                searchKontak();
              }),
          SizedBox(
            height: 20,
          ),

          //todo: Tampilin Kontak
          listKontak != null
              ? ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => chatRoomNdn(
                                penerimaUserId: listKontak!['username'],
                                penerimaUserEmail: listKontak!['email'])));
                  },
                  trailing: Icon(
                    Icons.message,
                    color: Colors.greenAccent,
                  ),
                  leading: Icon(
                    Icons.account_box_rounded,
                    color: Colors.redAccent,
                  ),
                  title: Text(listKontak!['username']),
                  subtitle: Text(listKontak!['email']),
                )
              : Container(),
        ],
      ),
    );
  }
}
