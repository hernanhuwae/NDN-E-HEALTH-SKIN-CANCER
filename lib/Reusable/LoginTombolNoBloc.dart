import 'package:flutter/material.dart';

class loginTombolnoBloc extends StatelessWidget {
  final Function() tekanLoginNoBloc;

  const loginTombolnoBloc({
    super.key,
    required this.tekanLoginNoBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Color(0XFFA2D2FF)),
      child: TextButton(
          onPressed: tekanLoginNoBloc,
          child: Text(
            'MASUK',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff03265B)),
          )),
    );
  }
}
