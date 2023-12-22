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
    apiKey: 'AIzaSyAznEnPVa9WDcxysi3AKBK5xSCB77B0SO8',
    appId: '1:128166978196:web:d1a4f7779cb8e81f01ca81',
    messagingSenderId: '128166978196',
    projectId: 'mimo-f9096',
    authDomain: 'mimo-f9096.firebaseapp.com',
    storageBucket: 'mimo-f9096.appspot.com',
    measurementId: 'G-76PQL41XB5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIo-zviqTIzKwYMKjf40VNxQh_9jfqzbk',
    appId: '1:128166978196:android:d8c6627e0e8e40aa01ca81',
    messagingSenderId: '128166978196',
    projectId: 'mimo-f9096',
    storageBucket: 'mimo-f9096.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYEj1BaVzE4vPnAruK6_Do_Z0kAomYsn8',
    appId: '1:128166978196:ios:743e486e3c7b113e01ca81',
    messagingSenderId: '128166978196',
    projectId: 'mimo-f9096',
    storageBucket: 'mimo-f9096.appspot.com',
    iosBundleId: 'com.example.todoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYEj1BaVzE4vPnAruK6_Do_Z0kAomYsn8',
    appId: '1:128166978196:ios:8378e56954d994f501ca81',
    messagingSenderId: '128166978196',
    projectId: 'mimo-f9096',
    storageBucket: 'mimo-f9096.appspot.com',
    iosBundleId: 'com.example.todoList.RunnerTests',
  );
}
