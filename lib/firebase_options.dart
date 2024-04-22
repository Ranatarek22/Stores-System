// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDLRQiLei8W1Dr3hNWHxjAfsX3IZTGTDXg',
    appId: '1:590216105456:web:121c7a1d5906b285416135',
    messagingSenderId: '590216105456',
    projectId: 'auth-app-5876b',
    authDomain: 'auth-app-5876b.firebaseapp.com',
    storageBucket: 'auth-app-5876b.appspot.com',
    measurementId: 'G-LGS823VRWE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTFg9arc4y4dl4Zvuzt9IuMfl00jxbbIY',
    appId: '1:590216105456:android:516b28e05c5647df416135',
    messagingSenderId: '590216105456',
    projectId: 'auth-app-5876b',
    storageBucket: 'auth-app-5876b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXG7WSm19P7N8Zf66cPfxcis5zU6SdcG4',
    appId: '1:590216105456:ios:65979991bf2c3a74416135',
    messagingSenderId: '590216105456',
    projectId: 'auth-app-5876b',
    storageBucket: 'auth-app-5876b.appspot.com',
    iosBundleId: 'com.example.assignment1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXG7WSm19P7N8Zf66cPfxcis5zU6SdcG4',
    appId: '1:590216105456:ios:65979991bf2c3a74416135',
    messagingSenderId: '590216105456',
    projectId: 'auth-app-5876b',
    storageBucket: 'auth-app-5876b.appspot.com',
    iosBundleId: 'com.example.assignment1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDLRQiLei8W1Dr3hNWHxjAfsX3IZTGTDXg',
    appId: '1:590216105456:web:9a1e384e588b9927416135',
    messagingSenderId: '590216105456',
    projectId: 'auth-app-5876b',
    authDomain: 'auth-app-5876b.firebaseapp.com',
    storageBucket: 'auth-app-5876b.appspot.com',
    measurementId: 'G-FVYH35NE2X',
  );
}
