import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_bloc_firebase_1/Reusable/LoginTombolNoBloc.dart';
import 'package:test_bloc_firebase_1/Reusable/textForm.dart';
import 'package:test_bloc_firebase_1/Reusable/tombolDaftarLogin.dart';
import 'package:test_bloc_firebase_1/Reusable/tombolLoginOnly.dart';
import 'package:test_bloc_firebase_1/cubit/cubit_login_cubit.dart';
import 'package:test_bloc_firebase_1/myService/auth_login.dart';

class LoginPageNdn extends StatefulWidget {
  LoginPageNdn({super.key});

  @override
  State<LoginPageNdn> createState() => _LoginPageNdnState();
}

class _LoginPageNdnState extends State<LoginPageNdn> {
  final myEmail = TextEditingController();
  final myPassword = TextEditingController();

  signIn(String myEmail, String myPassword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: myEmail, password: myPassword)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/scanning', (route) => false);
      });
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: 'Email dan Password tidak cocok',
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.7));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03265B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 225,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('gambar/ndn.png'))),
            ),
            SizedBox(
              height: 50,
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
                      'Login',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
              ],
            ),
            TextFormShare(
              teksForm: 'Email',
              hideText: false,
              controller: myEmail,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormShare(
              teksForm: 'Password',
              hideText: true,
              controller: myPassword,
            ),
            SizedBox(
              height: 40,
            ),

            //todo: Trigger fungsi Masuk Tombol Login
            loginTombolnoBloc(
              tekanLoginNoBloc: () {
                //todo: buat Sign In
                signIn(myEmail.text, myPassword.text);
              },
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya Akun?',
                  style: TextStyle(
                      color: Color(0xffFFC045), fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/daftarNdn');
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
          ],
        ),
      ),
    );
  }
}
