import 'package:flutter/material.dart';

class TextFormShare extends StatelessWidget {
  final String teksForm;
  final bool hideText;
  final TextEditingController controller;
  const TextFormShare(
      {super.key,
      required this.teksForm,
      required this.hideText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.blueAccent),
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),
      child: TextField(
        controller: controller,
        obscureText: hideText,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: teksForm,
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            focusColor: Colors.red,
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blueAccent,
            )),
      ),
    );
  }
}
