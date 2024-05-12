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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiM3B6EHXkdGOgEVo2SvevGP3sJ1Q2SNI',
    appId: '1:114578249167:android:07f984cf9e37c94ab16eba',
    messagingSenderId: '114578249167',
    projectId: 'qlish-8296f',
    storageBucket: 'qlish-8296f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAugd_dYhbweVzA7Do1BwXbW2TKy7GwK-0',
    appId: '1:114578249167:ios:f7d1b1dbf77f2a6ab16eba',
    messagingSenderId: '114578249167',
    projectId: 'qlish-8296f',
    storageBucket: 'qlish-8296f.appspot.com',
    iosBundleId: 'com.example.qlish',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAugd_dYhbweVzA7Do1BwXbW2TKy7GwK-0',
    appId: '1:114578249167:ios:f7d1b1dbf77f2a6ab16eba',
    messagingSenderId: '114578249167',
    projectId: 'qlish-8296f',
    storageBucket: 'qlish-8296f.appspot.com',
    iosBundleId: 'com.example.qlish',
  );
}
