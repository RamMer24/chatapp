import 'package:chatapp/screen/LoginScreen.dart';
import 'package:chatapp/screen/Pdf.dart';
import 'package:chatapp/screen/SaveImage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screen/CHATPAGE.dart';
import 'screen/HomePage.dart';
import 'screen/SplashScreen.dart';
import 'screen/chatapp.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:Pdf(),
    );
  }
}

