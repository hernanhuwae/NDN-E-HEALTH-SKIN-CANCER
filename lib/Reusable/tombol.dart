import 'package:flutter/material.dart';

class myTombol extends StatelessWidget {
  final String teksTombol;
  final Function() tekan;
  const myTombol({super.key, required this.teksTombol, required this.tekan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      height: 42,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffA2D2FF), borderRadius: BorderRadius.circular(18)),
      child: TextButton(
          onPressed: tekan,
          child: Text(
            teksTombol,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff03265B),
            ),
          )),
    );
  }
}
