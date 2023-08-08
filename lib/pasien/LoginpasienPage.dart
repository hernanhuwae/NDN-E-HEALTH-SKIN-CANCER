import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Reusable/LoginTombolNoBloc.dart';
import '../Reusable/textForm.dart';

class LoginPasienPageView extends StatefulWidget {
  LoginPasienPageView({super.key});

  @override
  State<LoginPasienPageView> createState() => _LoginPasienPageViewState();
}

class _LoginPasienPageViewState extends State<LoginPasienPageView> {
  final LoginPasienEmail = TextEditingController();
  final LoginPasienPasword = TextEditingController();
  final Auth = FirebaseAuth.instance;

  loginPasien(String Email, String Password) async {
    try {
      await Auth.signInWithEmailAndPassword(email: Email, password: Password)
          .then((value) {
        Navigator.pushNamed(context, '/kodeunikPasien');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user no found') {
        Fluttertoast.showToast(
            msg: 'Isi data',
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.7));
      } else if (e.code == 'ERROR_WRONG_PASSWORD') {
        Fluttertoast.showToast(
            msg: 'Email Password tidak cocok',
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.7));
      } else {
        Fluttertoast.showToast(
            msg: 'Tidak Valid',
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.7));
      }
    }
  }

  showError(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(child: Text('Email Dan Password Tidak Sama'))
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 3),
        gravity: ToastGravity.TOP);
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
              teksForm: 'Email', hideText: false, controller: LoginPasienEmail),
          SizedBox(
            height: 30,
          ),
          TextFormShare(
              teksForm: 'Password',
              hideText: true,
              controller: LoginPasienPasword),
          SizedBox(
            height: 100,
          ),
          loginTombolnoBloc(tekanLoginNoBloc: () {
            loginPasien(LoginPasienEmail.text, LoginPasienPasword.text);
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
                  Navigator.pushNamed(context, '/daftarpasien');
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
