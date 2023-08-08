import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Reusable/textForm.dart';
import 'Reusable/tombolDaftarLogin.dart';

class DaftarNoCubit extends StatefulWidget {
  DaftarNoCubit({super.key});
  @override
  State<DaftarNoCubit> createState() => _DaftarNoCubitState();
}

class _DaftarNoCubitState extends State<DaftarNoCubit> {
  //todo: Controllers
  TextEditingController _emailDaftarController = TextEditingController();
  TextEditingController _passwordDaftarController = TextEditingController();
  TextEditingController _kodeUnikDaftarController = TextEditingController();
  TextEditingController _usernameDaftarController = TextEditingController();

  //todo: Nambah Data Firestore
  Future addDataFirebaseDaftar(String emailDaftar, String passwordDaftar,
      String kodeUnikDaftar, String usernameDaftar) async {
    await FirebaseFirestore.instance.collection('pengguna').add({
      'email': emailDaftar,
      'password': passwordDaftar,
      'kodeUnik': kodeUnikDaftar,
      'username': usernameDaftar,
    });
  }

  @override
  void dispose() {
    _emailDaftarController.dispose();
    _passwordDaftarController.dispose();
    _kodeUnikDaftarController.dispose();
    _usernameDaftarController.dispose();
    super.dispose();
  }

  //todo: Buat email dan password di firestore
  Future DaftarNdn() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailDaftarController.text.trim(),
              password: _passwordDaftarController.text.trim())
          .then(
        (value) {
          Navigator.pushNamed(context, '/loginNdn');
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'channel-error') {
        Fluttertoast.showToast(
            msg: 'Isi data',
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.7));
      } else {
        Fluttertoast.showToast(
            msg: 'Tidak Valid',
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.7));
      }
    }
    addDataFirebaseDaftar(
        _emailDaftarController.text.trim(),
        _passwordDaftarController.text.trim(),
        _kodeUnikDaftarController.text.trim(),
        _usernameDaftarController.text.trim());
  }

  @override
  Widget build(BuildContext contex2w) {
    return Scaffold(
      backgroundColor: Color(0xff03265B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('gambar/ndn.png'))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'NDN E-HEALTH',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFFC045)),
            ),
            Text(
              'PENDETEKSI KANKER KULIT',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
              ],
            ),
            TextFormShare(
              teksForm: 'Username',
              hideText: false,
              controller: _usernameDaftarController,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormShare(
              teksForm: 'Email',
              hideText: false,
              controller: _emailDaftarController,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormShare(
              teksForm: 'Password',
              hideText: true,
              controller: _passwordDaftarController,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormShare(
              teksForm: 'kode Unik',
              hideText: true,
              controller: _kodeUnikDaftarController,
            ),
            SizedBox(
              height: 25,
            ),
            tombolDaftarLogin(
              tekan: DaftarNdn,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Sudah punya Akun?',
                    style: TextStyle(
                        color: Color(0xffFFC045), fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/loginNdn');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
