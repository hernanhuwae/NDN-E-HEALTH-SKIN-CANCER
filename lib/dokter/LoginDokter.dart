import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_bloc_firebase_1/Reusable/textForm.dart';

import '../Reusable/LoginTombolNoBloc.dart';

class LoginDokterPageView extends StatefulWidget {
  LoginDokterPageView({super.key});

  @override
  State<LoginDokterPageView> createState() => _LoginDokterPageViewState();
}

class _LoginDokterPageViewState extends State<LoginDokterPageView> {
  final LoginDokterEmail = TextEditingController();
  final LoginDokterPasword = TextEditingController();
  final Auth = FirebaseAuth.instance;

  loginPasien(String Email, String Password) async {
    try {
      await Auth.signInWithEmailAndPassword(email: Email, password: Password)
          .then((value) {
        Navigator.pushNamed(context, '/kodeunikdokter');
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: 'Email dan Password tidak cocok',
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
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )
            ],
          ),
          TextFormShare(
              teksForm: 'Email', hideText: false, controller: LoginDokterEmail),
          SizedBox(
            height: 30,
          ),
          TextFormShare(
              teksForm: 'Password',
              hideText: true,
              controller: LoginDokterPasword),
          SizedBox(
            height: 100,
          ),
          loginTombolnoBloc(tekanLoginNoBloc: () {
            loginPasien(LoginDokterEmail.text, LoginDokterPasword.text);
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
                  Navigator.pushNamed(context, '/daftardokter');
                },
                child: Text(
                  'Daftar',
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
