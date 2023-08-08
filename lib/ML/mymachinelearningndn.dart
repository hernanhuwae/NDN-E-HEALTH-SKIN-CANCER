import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc_firebase_1/main.dart';
import 'package:tflite/tflite.dart';

class mesinNdnCancerSkin extends StatefulWidget {
  const mesinNdnCancerSkin({super.key});

  @override
  State<mesinNdnCancerSkin> createState() => _mesinNdnCancerSkinState();
}

class _mesinNdnCancerSkinState extends State<mesinNdnCancerSkin> {
  CameraImage? mykameraimage;
  CameraController? mykamerakontrol;
  String result = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadcamera();
    loadmodel();
  }

  loadcamera() {
    mykamerakontrol = CameraController(kamera![0], ResolutionPreset.max);
    mykamerakontrol!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          mykamerakontrol!.startImageStream((ImageStream) {
            mykameraimage = ImageStream;
            goNdnModel();
          });
        });
      }
    });
  }

  goNdnModel() async {
    if (mykameraimage != null) {
      var prediksiNdn = await Tflite.runModelOnFrame(
          bytesList: mykameraimage!.planes.map((Plane) {
            return Plane.bytes;
          }).toList(),
          imageHeight: mykameraimage!.height,
          imageWidth: mykameraimage!.width,
          rotation: 90,
          imageMean: 127.5,
          imageStd: 127.5,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      prediksiNdn!.forEach((element) {
        setState(() {
          result = element['label'];
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03265B),
        centerTitle: true,
        title: Text(
          'NDN SCANNING CANCER SKIN',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFC045)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: !mykamerakontrol!.value.isInitialized
                  ? Container()
                  : AspectRatio(
                      aspectRatio: mykamerakontrol!.value.aspectRatio,
                      child: CameraPreview(mykamerakontrol!),
                    ),
            ),
          ),
          Text(
            result,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
