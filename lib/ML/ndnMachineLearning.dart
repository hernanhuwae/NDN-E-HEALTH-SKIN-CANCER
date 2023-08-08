import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ndnMachineLearning extends StatefulWidget {
  const ndnMachineLearning({super.key});

  @override
  State<ndnMachineLearning> createState() => _ndnMachineLearningState();
}

class _ndnMachineLearningState extends State<ndnMachineLearning> {
  bool _loading = true;
  late File _allfoto;
  late List _outputScanning;
  final getFoto = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadmyscanmodel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  gambardeteksi(File allfotoku) async {
    var outputScanning = await Tflite.runModelOnImage(
        path: allfotoku.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _outputScanning = outputScanning!;
      _loading = false;
    });
  }

  loadmyscanmodel() async {
    await Tflite.loadModel(
        model: 'assets/bestmodel_8.tflite', labels: 'assets/labels.txt');
  }

  openKamera() async {
    var foto = await getFoto.pickImage(source: ImageSource.camera);
    if (foto == null) return null;
    setState(() {
      _allfoto = File(foto.path);
    });
    gambardeteksi(_allfoto);
  }

  openGaleri() async {
    var foto = await getFoto.pickImage(source: ImageSource.gallery);
    if (foto == null) return null;
    setState(() {
      _allfoto = File(foto.path);
    });
    gambardeteksi(_allfoto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA2D2FF),
      appBar: AppBar(
        backgroundColor: Color(0xff03265B),
        title: Text(
          'SCANNING NDN E-HEALTH KANKER KULIT',
          style: TextStyle(fontSize: 15, color: Color(0xffFFC045)),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                    child: _loading == true
                        ? null
                        : Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 300,
                                  //MediaQuery.of(context).size.height * 0.5,
                                  width: 300,
                                  //MediaQuery.of(context).size.width * 0.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      _allfoto,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                _outputScanning != null
                                    ? Text(
                                        'TIPE KANKER KULIT ANDA : ${_outputScanning[0]['label']}',
                                        style: TextStyle(
                                            color: Color(0xff03265B),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      )
                                    : Container(),
                                // Divider(
                                //height: 20,
                                // thickness: 1,
                                //)
                              ],
                            ),
                          )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: openKamera,
                          child: Container(
                            width: 100,
                            height: 100,
                            //MediaQuery.of(context).size.width - 300,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('gambar/kamera.png'))),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: openGaleri,
                          child: Container(
                            width: 100,
                            height: 100,
                            //MediaQuery.of(context).size.width - 300,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('gambar/galeri.png'))),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Color(0xff03265B)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/scaninputndn', (route) => false);
                          },
                          child: Text(
                            'KIRIM',
                            style: TextStyle(
                                fontSize: 17, color: Color(0xffFFC045)),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
