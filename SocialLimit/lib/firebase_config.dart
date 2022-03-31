import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        appId: "1:1018427623584:web:fb37e5dc9f7b54d0f761c5",
        apiKey: "AIzaSyBGxd2mDyHe9LNruo6gV_TTEKyAw-V3YTA",
        projectId: "csci567s22-a78c3",
        authDomain: "csci567s22-a78c3.firebaseapp.com",
        storageBucket: "csci567s22-a78c3.appspot.com",
        messagingSenderId: "1018427623584",
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:1018427623584:ios:eeb6a3e9e3dea005f761c5',
        apiKey: 'AIzaSyBoNxKBSL0jiQxyE8_Mv-RCysFeYmxXTsE',
        projectId: 'csci567s22-a78c3',
        messagingSenderId: '1018427623584',
        storageBucket: 'csci567s22-a78c3.appspot.com',
        iosBundleId: 'com.example.socialLimit',
      );
    }
    else {
      // Android
      return const FirebaseOptions(
        appId: '1:1018427623584:android:777ff453ab4c1baff761c5',
        apiKey: 'AIzaSyBfVWERdfeIb2TAsLut68rJpis9pXR-Hug',
        projectId: 'csci567s22-a78c3',
        storageBucket: "csci567s22-a78c3.appspot.com",
        messagingSenderId: '1018427623584',
      );
    }
  }
}