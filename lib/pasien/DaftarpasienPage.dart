import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_bloc_firebase_1/Reusable/LoginTombolNoBloc.dart';
import 'package:test_bloc_firebase_1/Reusable/textForm.dart';

class DaftarPasienPageView extends StatefulWidget {
  DaftarPasienPageView({super.key});

  @override
  State<DaftarPasienPageView> createState() => _DaftarPasienPageViewState();
}

class _DaftarPasienPageViewState extends State<DaftarPasienPageView> {
  final dokterEmail = TextEditingController();

  final dokterPassword = TextEditingController();

  final Auth = FirebaseAuth.instance;

  register(String emailPasienDaftar, passswordPasienDaftar) async {
    try {
      await Auth.createUserWithEmailAndPassword(
              email: emailPasienDaftar, password: passswordPasienDaftar)
          .then((value) {
        Navigator.pushNamed(context, '/loginpasien');
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
              teksForm: 'Email', hideText: false, controller: dokterEmail),
          SizedBox(
            height: 30,
          ),
          TextFormShare(
              teksForm: 'Password', hideText: true, controller: dokterPassword),
          SizedBox(
            height: 100,
          ),
          loginTombolnoBloc(tekanLoginNoBloc: () {
            register(dokterEmail.text, dokterPassword.text);
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
                      context, '/loginpasien', (route) => false);
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
