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
    apiKey: 'AIzaSyAlkam9XvXht-7ApOCwRQ3zhILAQg-UXs4',
    appId: '1:1014003108202:web:4dac7336be51938256fd13',
    messagingSenderId: '1014003108202',
    projectId: 'tally-dev-e1',
    authDomain: 'tally-dev-e1.firebaseapp.com',
    storageBucket: 'tally-dev-e1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_agpT5TtwUNIm07HIZ0H-XRjmi4zjsVg',
    appId: '1:1014003108202:android:80527e4424c8fbad56fd13',
    messagingSenderId: '1014003108202',
    projectId: 'tally-dev-e1',
    storageBucket: 'tally-dev-e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWkPx7uGR7Me0oiE2ty9jnVMhJdVBAVg8',
    appId: '1:1014003108202:ios:949c449037e495f656fd13',
    messagingSenderId: '1014003108202',
    projectId: 'tally-dev-e1',
    storageBucket: 'tally-dev-e1.appspot.com',
    iosBundleId: 'com.example.material3Demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWkPx7uGR7Me0oiE2ty9jnVMhJdVBAVg8',
    appId: '1:1014003108202:ios:949c449037e495f656fd13',
    messagingSenderId: '1014003108202',
    projectId: 'tally-dev-e1',
    storageBucket: 'tally-dev-e1.appspot.com',
    iosBundleId: 'com.example.material3Demo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAlkam9XvXht-7ApOCwRQ3zhILAQg-UXs4',
    appId: '1:1014003108202:web:141a946ea64d1d1356fd13',
    messagingSenderId: '1014003108202',
    projectId: 'tally-dev-e1',
    authDomain: 'tally-dev-e1.firebaseapp.com',
    storageBucket: 'tally-dev-e1.appspot.com',
  );
}
