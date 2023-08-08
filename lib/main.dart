import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_firebase_1/ChatNdnApp/searchUser.dart';
import 'package:test_bloc_firebase_1/DaftarNdn.dart';
import 'package:test_bloc_firebase_1/LoginNdn.dart';
import 'package:test_bloc_firebase_1/ML/InputDataScan.dart';
import 'package:test_bloc_firebase_1/ML/mlv2.dart';
import 'package:test_bloc_firebase_1/ML/mymachinelearningndn.dart';
import 'package:test_bloc_firebase_1/ML/ndnMachineLearning.dart';
import 'package:test_bloc_firebase_1/cubit/cubit_login_cubit.dart';
import 'package:test_bloc_firebase_1/dokter/DaftarDokter.dart';
import 'package:test_bloc_firebase_1/dokter/KodeUnikDokter.dart';
import 'package:test_bloc_firebase_1/dokter/LoginDokter.dart';
import 'package:test_bloc_firebase_1/dokter/MonitoringDokter.dart';
import 'package:test_bloc_firebase_1/firebase_options.dart';
import 'package:test_bloc_firebase_1/homepage.dart';
import 'package:test_bloc_firebase_1/model/userModel.dart';
import 'package:test_bloc_firebase_1/pasien/DaftarpasienPage.dart';
import 'package:test_bloc_firebase_1/pasien/LoginpasienPage.dart';
import 'package:test_bloc_firebase_1/pasien/MonitoringPasien.dart';
import 'package:test_bloc_firebase_1/pasien/kodeUnikPasien.dart';
import 'package:test_bloc_firebase_1/scanning.dart';
import 'package:test_bloc_firebase_1/splashScreen.dart';
import 'package:bloc/bloc.dart';
import 'DaftarNoCubit.dart';
import 'cubit/cubit/auth_cubit.dart';

List<CameraDescription>? kamera;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kamera = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myDemoNdnLoginRegister());
}

class myDemoNdnLoginRegister extends StatelessWidget {
  const myDemoNdnLoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => ndnSplashScreen(),
          '/homepage': (context) => ndnHomePage(),
          '/daftarNdn': (context) => DaftarPageNdn(),
          '/daftarNdnku': (context) => DaftarNoCubit(),
          '/loginNdn': (context) => LoginPageNdn(),
          '/scanning': (context) => ScanningPage(),
          '/daftarpasien': (context) => DaftarPasienPageView(),
          '/loginpasien': (context) => LoginPasienPageView(),
          '/kodeunikPasien': (context) => KodeUnikPasien(),
          '/monitoringPasien': (context) => MonitoringPage(),
          '/mesinNdn': (context) => ndnmesinv2(),
          '/mesinNdn2': (context) => mesinNdnCancerSkin(),
          '/cobaajaml': (context) => ndnMachineLearning(),
          '/daftardokter': (context) => DaftarDokterPageView(),
          '/logindokter': (context) => LoginDokterPageView(),
          '/monitoringdokter': (context) => MonitoringPageDokter(),
          '/kodeunikdokter': (context) => KodeUnikDokter(),
          '/searchchathome': (context) => SearchHomeChatNdn(),
          '/scaninputndn': (context) => ScanInputNDN(),
        },
      ),
    );
  }
}
