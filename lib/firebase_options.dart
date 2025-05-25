
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyBUdoAt3DjLISu8LuIat6MwZb--RIA44D4',
    appId: '1:120616115979:web:fd2c1dea10b26e15ac0c0e',
    messagingSenderId: '120616115979',
    projectId: 'music-services-48259',
    authDomain: 'music-services-48259.firebaseapp.com',
    storageBucket: 'music-services-48259.firebasestorage.app',
    measurementId: 'G-SCWMJHSE24',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSv-BqjDbP6AOiEtQMKvLQDPXsJOD1YJs',
    appId: '1:120616115979:android:2548230c2759a60cac0c0e',
    messagingSenderId: '120616115979',
    projectId: 'music-services-48259',
    storageBucket: 'music-services-48259.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDmExqkPLrpX_V99faYsiYvoOeMYIR1LQ',
    appId: '1:120616115979:ios:044d02622cd74cf8ac0c0e',
    messagingSenderId: '120616115979',
    projectId: 'music-services-48259',
    storageBucket: 'music-services-48259.firebasestorage.app',
    iosBundleId: 'com.example.musicservices',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDmExqkPLrpX_V99faYsiYvoOeMYIR1LQ',
    appId: '1:120616115979:ios:044d02622cd74cf8ac0c0e',
    messagingSenderId: '120616115979',
    projectId: 'music-services-48259',
    storageBucket: 'music-services-48259.firebasestorage.app',
    iosBundleId: 'com.example.musicservices',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUdoAt3DjLISu8LuIat6MwZb--RIA44D4',
    appId: '1:120616115979:web:eda65569766335faac0c0e',
    messagingSenderId: '120616115979',
    projectId: 'music-services-48259',
    authDomain: 'music-services-48259.firebaseapp.com',
    storageBucket: 'music-services-48259.firebasestorage.app',
    measurementId: 'G-FK7G9YBC13',
  );

}