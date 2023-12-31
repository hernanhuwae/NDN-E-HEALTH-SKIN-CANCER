// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAdf0eJDJtvzDMETzRVTqKcMd8AiCoy5Bc',
    appId: '1:196545797939:web:fddf3935dcaabba2b72846',
    messagingSenderId: '196545797939',
    projectId: 'ndn-firebase-cubit',
    authDomain: 'ndn-firebase-cubit.firebaseapp.com',
    databaseURL: 'https://ndn-firebase-cubit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ndn-firebase-cubit.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFUs4hdVxt74wdwjUc6UVbdHDg6-kmkx0',
    appId: '1:196545797939:android:122cb152c26a917fb72846',
    messagingSenderId: '196545797939',
    projectId: 'ndn-firebase-cubit',
    databaseURL: 'https://ndn-firebase-cubit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ndn-firebase-cubit.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDU0CZdtqT02swTOo78F9cZrkgMre5Fp-w',
    appId: '1:196545797939:ios:ae64af8d07d06dc3b72846',
    messagingSenderId: '196545797939',
    projectId: 'ndn-firebase-cubit',
    databaseURL: 'https://ndn-firebase-cubit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ndn-firebase-cubit.appspot.com',
    iosClientId: '196545797939-aoher11galmrv0rr51i1t5f5m7us8cau.apps.googleusercontent.com',
    iosBundleId: 'com.example.testBlocFirebase1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDU0CZdtqT02swTOo78F9cZrkgMre5Fp-w',
    appId: '1:196545797939:ios:ae64af8d07d06dc3b72846',
    messagingSenderId: '196545797939',
    projectId: 'ndn-firebase-cubit',
    databaseURL: 'https://ndn-firebase-cubit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ndn-firebase-cubit.appspot.com',
    iosClientId: '196545797939-aoher11galmrv0rr51i1t5f5m7us8cau.apps.googleusercontent.com',
    iosBundleId: 'com.example.testBlocFirebase1',
  );
}
