import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_firebase_1/Reusable/textForm.dart';
import 'package:test_bloc_firebase_1/Reusable/tombolDaftarLogin.dart';

import 'cubit/cubit/auth_cubit.dart';

class DaftarPageNdn extends StatelessWidget {
  DaftarPageNdn({super.key});

  //todo: Controllers Form

  TextEditingController _emailController = TextEditingController(text: '');
  TextEditingController _passwordController = TextEditingController(text: '');
  TextEditingController _kodeUnikController = TextEditingController(text: '');
  TextEditingController _username = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03265B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 275,
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
              teksForm: 'Email',
              hideText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormShare(
              teksForm: 'Username',
              hideText: false,
              controller: _username,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormShare(
              teksForm: 'Password',
              hideText: true,
              controller: _passwordController,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormShare(
              teksForm: 'kode Unik',
              hideText: true,
              controller: _kodeUnikController,
            ),
            SizedBox(
              height: 40,
            ),
            tombolDaftarLogin(
              tekan: () {
                context.read<AuthCubit>().toDaftarNdn(
                      email: _emailController.text,
                      username: _username.text,
                      password: _passwordController.text,
                      kodeUnik: _kodeUnikController.text,
                    );
              },
            ),
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
