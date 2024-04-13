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
    apiKey: 'AIzaSyAqJ-vSLbNojBkNSZYupWTa8O-TWrWq0-M',
    appId: '1:292727163274:web:e70c609e87f09b49376073',
    messagingSenderId: '292727163274',
    projectId: 'help-buddies',
    authDomain: 'help-buddies.firebaseapp.com',
    storageBucket: 'help-buddies.appspot.com',
    measurementId: 'G-RXWVFBCVTH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUxzVxepIvA41FsvOpr9-FTrWakjGnoxo',
    appId: '1:292727163274:android:ec174894bdf504b8376073',
    messagingSenderId: '292727163274',
    projectId: 'help-buddies',
    storageBucket: 'help-buddies.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnZkvQBqqGaokobgmWpxOkIKhFuXripqw',
    appId: '1:292727163274:ios:ce82a1d3920febb7376073',
    messagingSenderId: '292727163274',
    projectId: 'help-buddies',
    storageBucket: 'help-buddies.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnZkvQBqqGaokobgmWpxOkIKhFuXripqw',
    appId: '1:292727163274:ios:ce82a1d3920febb7376073',
    messagingSenderId: '292727163274',
    projectId: 'help-buddies',
    storageBucket: 'help-buddies.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAqJ-vSLbNojBkNSZYupWTa8O-TWrWq0-M',
    appId: '1:292727163274:web:3a619b6488f72a5d376073',
    messagingSenderId: '292727163274',
    projectId: 'help-buddies',
    authDomain: 'help-buddies.firebaseapp.com',
    storageBucket: 'help-buddies.appspot.com',
    measurementId: 'G-JTZYB37H3V',
  );
}