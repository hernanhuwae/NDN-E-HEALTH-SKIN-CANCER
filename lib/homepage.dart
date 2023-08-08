import 'package:flutter/material.dart';
import 'package:test_bloc_firebase_1/Reusable/tombol.dart';

class ndnHomePage extends StatelessWidget {
  const ndnHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 100,
            ),
            myTombol(
                teksTombol: 'Petugas',
                tekan: () {
                  Navigator.pushNamed(context, '/daftarNdnku');
                }),
            SizedBox(height: 45),
            myTombol(
                teksTombol: 'Pasien',
                tekan: () {
                  Navigator.pushNamed(context, '/daftarpasien');
                }),
            SizedBox(height: 45),
            myTombol(
                teksTombol: 'Dokter',
                tekan: () {
                  Navigator.pushNamed(context, '/daftardokter');
                }),
          ],
        ),
      ),
    );
  }
}
