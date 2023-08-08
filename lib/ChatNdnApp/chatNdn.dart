import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_bloc_firebase_1/ChatNdnApp/backendChatNdn.dart';
import 'package:test_bloc_firebase_1/ChatNdnApp/kustomPesanUI.dart';
import 'package:test_bloc_firebase_1/Reusable/textForm.dart';

class chatRoomNdn extends StatefulWidget {
  final String penerimaUserId;
  final String penerimaUserEmail;

  const chatRoomNdn(
      {super.key,
      required this.penerimaUserId,
      required this.penerimaUserEmail});

  @override
  State<chatRoomNdn> createState() => _chatRoomNdnState();
}

class _chatRoomNdnState extends State<chatRoomNdn> {
  final TextEditingController pesanKontroller = TextEditingController();
  final chatNdnService _chatNdnService = chatNdnService();
  final FirebaseAuth _authNdnChat = FirebaseAuth.instance;

  //todo: Kirim Pesan
  void kirimPesan() async {
    if (pesanKontroller.text.isNotEmpty) {
      await _chatNdnService.kirimpesan(
          widget.penerimaUserId, pesanKontroller.text);
      pesanKontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03265B),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 30,
              color: Colors.green,
            ),
          )
        ],
        title: Text(
          widget.penerimaUserEmail,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: DaftarListPesan()),
          InputPesanText(),
        ],
      ),
    );
  }

  //todo: Widget buat List Pesan
  Widget DaftarListPesan() {
    return StreamBuilder(
      stream: _chatNdnService.getNdnAllMessage(
          widget.penerimaUserId, _authNdnChat.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Erro${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((mydocument) => BuildListPesan(mydocument))
              .toList(),
        );
      },
    );
  }

  //todo: Widget buat pesan Item
  Widget BuildListPesan(DocumentSnapshot myDocNdn) {
    Map<String, dynamic> data = myDocNdn.data() as Map<String, dynamic>;

    //todo: Current User pesan ke kanan dan sebaliknya
    var alignmentChatting =
        (data['pengirimId'] == _authNdnChat.currentUser!.uid)
            ? Alignment.centerRight
            : Alignment.centerLeft;

    return Container(
      alignment: alignmentChatting,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['pengirimId'] == _authNdnChat.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['pengirimId'] == _authNdnChat.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.end,
          children: [
            Text(data['pengirimMessage']),
            SizedBox(
              height: 5,
            ),
            kustomChat(myMessageDesain: data['messageNdn'])
          ],
        ),
      ),
    );
  }

  //todo: Wdget buat InputPesanList
  Widget InputPesanText() {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: Color.fromARGB(255, 65, 129, 241)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
          ),
          child: TextField(
            controller: pesanKontroller,
            obscureText: false,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Ketik Pesan',
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                focusColor: Colors.red,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blueAccent,
                )),
          ),
        )),
        IconButton(
            onPressed: () {
              kirimPesan();
            },
            icon: Icon(
              Icons.send,
              size: 35,
              color: Color(0xff03265B),
            ))
      ],
    );
  }
}
