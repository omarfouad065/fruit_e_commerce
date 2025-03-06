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
    apiKey: 'AIzaSyCdcpLahXxyX9SDRBeWxAzBXCCCC0hpm8w',
    appId: '1:632286873246:web:84b06d91831b1ae5111d8f',
    messagingSenderId: '632286873246',
    projectId: 'fruit-hub-1b7dc',
    authDomain: 'fruit-hub-1b7dc.firebaseapp.com',
    storageBucket: 'fruit-hub-1b7dc.firebasestorage.app',
    measurementId: 'G-XCZ36S0K1K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJo2VYlIrwTV1fIljarLnV2ovBNeTxCbE',
    appId: '1:632286873246:android:a4a7ed7bf2dc2e51111d8f',
    messagingSenderId: '632286873246',
    projectId: 'fruit-hub-1b7dc',
    storageBucket: 'fruit-hub-1b7dc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArIOngeCt84goapQJAkzrqtttJa_DsYns',
    appId: '1:632286873246:ios:74e5067c317020c2111d8f',
    messagingSenderId: '632286873246',
    projectId: 'fruit-hub-1b7dc',
    storageBucket: 'fruit-hub-1b7dc.firebasestorage.app',
    iosBundleId: 'com.example.fruitECommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArIOngeCt84goapQJAkzrqtttJa_DsYns',
    appId: '1:632286873246:ios:74e5067c317020c2111d8f',
    messagingSenderId: '632286873246',
    projectId: 'fruit-hub-1b7dc',
    storageBucket: 'fruit-hub-1b7dc.firebasestorage.app',
    iosBundleId: 'com.example.fruitECommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCdcpLahXxyX9SDRBeWxAzBXCCCC0hpm8w',
    appId: '1:632286873246:web:ee4c1d9626b38c2e111d8f',
    messagingSenderId: '632286873246',
    projectId: 'fruit-hub-1b7dc',
    authDomain: 'fruit-hub-1b7dc.firebaseapp.com',
    storageBucket: 'fruit-hub-1b7dc.firebasestorage.app',
    measurementId: 'G-D2X7X4BK0V',
  );
}
