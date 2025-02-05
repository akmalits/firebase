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
    apiKey: 'AIzaSyCVHMO4-18R8oh1Lw8HJkI9Pb0kwRdZyM4',
    appId: '1:885940107434:web:f4a0d17ead0b6a829f38d3',
    messagingSenderId: '885940107434',
    projectId: 'fireb-1703f',
    authDomain: 'fireb-1703f.firebaseapp.com',
    databaseURL: 'https://fireb-1703f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fireb-1703f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvF_9xNzuDPonuZ8F2Y2g_fCXLfvHu8UE',
    appId: '1:885940107434:android:50408950abe70a129f38d3',
    messagingSenderId: '885940107434',
    projectId: 'fireb-1703f',
    databaseURL: 'https://fireb-1703f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fireb-1703f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP88w2kzQlBkLDj6UqJ0CJp5xtnQHXhEE',
    appId: '1:885940107434:ios:66ccac2e8d4def5a9f38d3',
    messagingSenderId: '885940107434',
    projectId: 'fireb-1703f',
    databaseURL: 'https://fireb-1703f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fireb-1703f.appspot.com',
    iosBundleId: 'com.example.fireeeee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP88w2kzQlBkLDj6UqJ0CJp5xtnQHXhEE',
    appId: '1:885940107434:ios:66ccac2e8d4def5a9f38d3',
    messagingSenderId: '885940107434',
    projectId: 'fireb-1703f',
    databaseURL: 'https://fireb-1703f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fireb-1703f.appspot.com',
    iosBundleId: 'com.example.fireeeee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVHMO4-18R8oh1Lw8HJkI9Pb0kwRdZyM4',
    appId: '1:885940107434:web:fa2a4fc205cd787c9f38d3',
    messagingSenderId: '885940107434',
    projectId: 'fireb-1703f',
    authDomain: 'fireb-1703f.firebaseapp.com',
    databaseURL: 'https://fireb-1703f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fireb-1703f.appspot.com',
  );

}