import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'config/myapp.dart';
import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


// const FirebaseOptions(
// apiKey: 'AIzaSyBEhm7hatNL8R_OWm--HcwogOna8TGgvHM',//current_key
// appId: "1:55921185946:android:b84027636619b1894e7b23", //mobilesdk_app_id
// messagingSenderId: "55921185946", //project_number
// projectId: "e-commerce-68732",
// )