import 'dart:async';

import 'package:flutter/material.dart';

class ndnSplashScreen extends StatefulWidget {
  const ndnSplashScreen({super.key});

  @override
  State<ndnSplashScreen> createState() => _ndnSplashScreenState();
}

class _ndnSplashScreenState extends State<ndnSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/homepage');
    });

    return Scaffold(
      backgroundColor: Color(0xff03265B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 275,
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
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
