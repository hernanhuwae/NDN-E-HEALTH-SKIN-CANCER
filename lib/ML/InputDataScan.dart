import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ScanInputNDN extends StatefulWidget {
  const ScanInputNDN({super.key});

  @override
  State<ScanInputNDN> createState() => _ScanInputNDNState();
}

class _ScanInputNDNState extends State<ScanInputNDN> {
  double _progress = 0;
  late InAppWebViewController _ndnWebController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
              icon: Icon(Icons.arrow_back))
        ],
        backgroundColor: Color(0xff03265B),
        centerTitle: true,
        title: Text(
          'VALIDASI DATA',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFC045)),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse('https://inputdatandn.netlify.app/')),
            onWebViewCreated: (InAppWebViewController controller) {
              _ndnWebController = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor:
                        Theme.of(context).accentColor.withOpacity(0.7),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
