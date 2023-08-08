import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NdnVebViewDokter extends StatefulWidget {
  const NdnVebViewDokter({super.key});

  @override
  State<NdnVebViewDokter> createState() => _NdnVebViewDokterState();
}

class _NdnVebViewDokterState extends State<NdnVebViewDokter> {
  double _progress = 0;
  late InAppWebViewController _ndnWebController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color(0xff03265B),
        centerTitle: true,
        title: Text(
          'DOKTER KONSULTASI',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFC045)),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse('https://konsultasindn.netlify.app/')),
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
