import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_bloc_firebase_1/webview/WebViewNdn.dart';
import 'package:tflite/tflite.dart';

class ndnmesinv2 extends StatefulWidget {
  const ndnmesinv2({super.key});

  @override
  State<ndnmesinv2> createState() => _ndnmesinv2State();
}

class _ndnmesinv2State extends State<ndnmesinv2> {
  bool _loading = true;
  late File _image;
  final Ndnimagepicker = ImagePicker();
  List _prediksiNdn = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNdnMachineLearning();
  }

  loadNdnMachineLearning() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  deteksi_gambar(File ndngambarku) async {
    var prediksiNdn = await Tflite.runModelOnImage(
      path: ndngambarku.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _loading = false;
      prediksiNdn = _prediksiNdn;
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  _loadimage_galeri() async {
    var gambarNdn = await Ndnimagepicker.pickImage(source: ImageSource.gallery);
    if (gambarNdn == null) {
      return Null;
    } else {
      setState(() {
        _loading = false;
      });
      _image = File(gambarNdn.path);
    }
    deteksi_gambar(_image);
  }

  _loadimage_kamera() async {
    var gambarNdn = await Ndnimagepicker.pickImage(source: ImageSource.camera);
    if (gambarNdn == null) {
      return Null;
    } else {
      setState(() {
        _loading = false;
      });
      _image = File(gambarNdn.path);
    }
    deteksi_gambar(_image);
  }

  @override
  Widget build(BuildContext context) {
    //todo: Body Session Scanning
    Widget bodyScanning() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _loadimage_kamera();
                    },
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('gambar/kamera.png'))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _loadimage_galeri();
                    },
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('gambar/galeri.png'))),
                    ),
                  )
                ],
              ),
              _loading == false
                  ? Container(
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 200,
                            child: Image.file(_image),
                          ),
                          Text('Wajah Anda Lagi: ${_prediksiNdn[1]['label']}')
                        ],
                      ),
                    )
                  : Container()
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
          height: 100,
          alignment: Alignment.center,
          width: double.infinity,
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff03265B),
          centerTitle: true,
          title: Text(
            'NDN SCANNING',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFC045)),
          ),
        ),
        backgroundColor: Color(0xffA2D2FF),
        body: Stack(
          children: [bodyScanning(), NavbarScanning()],
        ));
  }
}
