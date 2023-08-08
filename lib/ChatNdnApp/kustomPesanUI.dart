import 'package:flutter/material.dart';

class kustomChat extends StatelessWidget {
  final String myMessageDesain;
  const kustomChat({super.key, required this.myMessageDesain});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff03265B),
      ),
      child: Text(
        myMessageDesain,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}
