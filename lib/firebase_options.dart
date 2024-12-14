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
    apiKey: 'AIzaSyC2lHgV2fO6g3fZCqIayb839R0KCemqAKY',
    appId: '1:617333452165:web:44350be2e98e60124a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    authDomain: 'projectauth-50b3e.firebaseapp.com',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    measurementId: 'G-PCER5DMW4C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_Emn6_QmfxK1uRaPhmkcW1DkFi4gsick',
    appId: '1:617333452165:android:600cdc4fb6d0dca74a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjqU4cxuDFMYtDuolnarSfRcgUWtpuZWQ',
    appId: '1:617333452165:ios:e6485ff3f1ee8bab4a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    iosBundleId: 'com.example.toDoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjqU4cxuDFMYtDuolnarSfRcgUWtpuZWQ',
    appId: '1:617333452165:ios:e6485ff3f1ee8bab4a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    iosBundleId: 'com.example.toDoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC2lHgV2fO6g3fZCqIayb839R0KCemqAKY',
    appId: '1:617333452165:web:cc4dcb5b14d279a34a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    authDomain: 'projectauth-50b3e.firebaseapp.com',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    measurementId: 'G-P5D56V7MNM',
  );
}
