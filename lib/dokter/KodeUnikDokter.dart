import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Reusable/LoginTombolNoBloc.dart';
import '../Reusable/textForm.dart';

class KodeUnikDokter extends StatefulWidget {
  const KodeUnikDokter({super.key});

  @override
  State<KodeUnikDokter> createState() => _KodeUnikDokterState();
}

class _KodeUnikDokterState extends State<KodeUnikDokter> {
  TextEditingController KodeUnik = TextEditingController();

  //todo: Membuat akses logic untuk kode unik
  Future<void> getDataNdn() async {
    CollectionReference getDataNdnFirestore =
        FirebaseFirestore.instance.collection('pengguna');

    //todo: Sinkronisasi kodeUnik Controller dengan field database
    QuerySnapshot _isDataSnapshotNdn = await getDataNdnFirestore
        .where('kodeUnik', isEqualTo: KodeUnik.text)
        .get();

    if (_isDataSnapshotNdn.docs.isNotEmpty) {
      DocumentSnapshot fileNdn = _isDataSnapshotNdn.docs.first;
      Map<String, dynamic> myData = fileNdn.data() as Map<String, dynamic>;
      if (myData['kodeUnik'] == KodeUnik.text.trim()) {
        Navigator.pushNamed(context, '/monitoringdokter');
      } else {
        Navigator.pushNamed(context, '/homepage');
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Kode Unik Tidak Terdaftar',
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF03265B),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 213,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('gambar/ndn.png'))),
          ),
          Text(
            'NDN E-HEALTH',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFC045)),
          ),
          Text(
            'PENDETEKSI KANKER KULIT',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                child: Text(
                  'AKSES KODE UNIK',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          TextFormShare(
              teksForm: 'Masukkan kode Unik dari Petugas',
              hideText: false,
              controller: KodeUnik),
          SizedBox(
            height: 30,
          ),
          loginTombolnoBloc(tekanLoginNoBloc: () {
            getDataNdn();
          }),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
