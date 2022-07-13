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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAY8TyiKUMWyWwBipp7u5bAB9joeBpJHR8',
    appId: '1:348970174673:android:7a5067e351e85149d15df0',
    messagingSenderId: '348970174673',
    projectId: 'bliksy-404e2',
    storageBucket: 'bliksy-404e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC39-e0PPk5EXi4LXfg39l_nsQ-d0XIBv8',
    appId: '1:348970174673:ios:f88665338958b522d15df0',
    messagingSenderId: '348970174673',
    projectId: 'bliksy-404e2',
    storageBucket: 'bliksy-404e2.appspot.com',
    androidClientId: '348970174673-cj5glkfibd3mkf2p0q13v1mu79jh6d41.apps.googleusercontent.com',
    iosClientId: '348970174673-cimknq3e91lc91ne3nqdu98nlcqmupaq.apps.googleusercontent.com',
    iosBundleId: 'com.digixvalley.bliksy.bliksy',
  );
}
