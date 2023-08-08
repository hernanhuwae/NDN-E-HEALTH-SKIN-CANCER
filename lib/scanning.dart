import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:test_bloc_firebase_1/ML/mymachinelearningndn.dart';
import 'package:test_bloc_firebase_1/webview/WebViewNdn.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  final penggunaNdn = FirebaseAuth.instance.currentUser!;
  final userme = FirebaseFirestore.instance.collection('pengguna');

  @override
  Widget build(BuildContext context) {
    //todo: Header session Scanning
    Widget headerScanning() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      penggunaNdn.email!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                width: 38,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image:
                        DecorationImage(image: AssetImage('gambar/user.png'))),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('gambar/backgroundscan.png'))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(left: 50),
                width: 115,
                height: 115,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('gambar/ndn.png'))),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'NDN E-HEALTH',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFC045)),
                    ),
                    Text(
                      'PENDETEKSI KANKER KULIT',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      );
    }

    //todo: Body Session Scanning
    Widget bodyScanning() {
      return Container(
        margin: EdgeInsets.only(top: 185),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 150),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cobaajaml');
                },
                child: Container(
                  width: 212,
                  height: 212,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('gambar/scan.png'))),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //todo: Navbar-1 Session Scanning
    Widget NavbarScanning() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffA2D2FF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 7,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/homepage');
            },
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'gambar/homebutton.png',
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget NavbarScanning2() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          child: Image.asset('gambar/navbarscan.png'),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color(0xffA2D2FF),
        body: Stack(
          children: [
            bodyScanning(),
            headerScanning(),
            NavbarScanning2(),
            NavbarScanning()
          ],
        ));
  }
}
