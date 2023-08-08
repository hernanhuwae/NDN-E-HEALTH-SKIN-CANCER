import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/auth_cubit.dart';
import '../cubit/cubit/auth_state.dart';

class tombolDaftarLogin extends StatelessWidget {
  final Function() tekan;
  const tombolDaftarLogin({super.key, required this.tekan});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, authState>(
      listener: (context, state) {
        if (state is AuthSukses) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/loginNdn', (route) => false);
        } else if (state is AuthGagal) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.ErrorNdn),
            backgroundColor: Colors.redAccent,
          ));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
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
              onPressed: tekan,
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
