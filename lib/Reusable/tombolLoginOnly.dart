import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_firebase_1/cubit/cubit_login_cubit.dart';

class LoginTombolOnly extends StatelessWidget {
  final Function() tekanLogin;
  const LoginTombolOnly({super.key, required this.tekanLogin});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitLoginCubit, CubitLoginState>(
      listener: (context, state) {
        if (state is AuthSuksesLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/scanning', (route) => false);
        } else if (state is AuthGagalLogin) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorLoginNdn),
            backgroundColor: Colors.blueAccent,
          ));
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingLogin) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0XFFA2D2FF)),
          child: TextButton(
              onPressed: tekanLogin,
              child: Text(
                'MASUK',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff03265B)),
              )),
        );
      },
    );
  }
}
