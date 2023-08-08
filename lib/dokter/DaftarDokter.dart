import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Reusable/LoginTombolNoBloc.dart';
import '../Reusable/textForm.dart';

class DaftarDokterPageView extends StatefulWidget {
  DaftarDokterPageView({super.key});

  @override
  State<DaftarDokterPageView> createState() => _DaftarDokterPageViewState();
}

class _DaftarDokterPageViewState extends State<DaftarDokterPageView> {
  final pasienEmail = TextEditingController();

  final pasienPassword = TextEditingController();

  final Auth = FirebaseAuth.instance;

  final database = FirebaseFirestore.instance;
  register(String emailPasienDaftar, passswordPasienDaftar) async {
    try {
      await Auth.createUserWithEmailAndPassword(
              email: emailPasienDaftar, password: passswordPasienDaftar)
          .then((value) {
        Navigator.pushNamed(context, '/logindokter');
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: 'Mohon lengkapi Data Dibawah',
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03265B),
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
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                child: Text(
                  'DAFTAR',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )
            ],
          ),
          TextFormShare(
              teksForm: 'Email', hideText: false, controller: pasienEmail),
          SizedBox(
            height: 30,
          ),
          TextFormShare(
              teksForm: 'Password', hideText: true, controller: pasienPassword),
          SizedBox(
            height: 100,
          ),
          loginTombolnoBloc(tekanLoginNoBloc: () {
            register(pasienEmail.text, pasienPassword.text);
          }),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sudah punya Akun?',
                style: TextStyle(
                    color: Color(0xffFFC045), fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/logindokter', (route) => false);
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
        ]),
      ),
    );
  }
}
