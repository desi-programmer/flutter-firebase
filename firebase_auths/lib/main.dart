import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auths/pages/auth/login.dart';
import 'package:firebase_auths/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentications',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "lato",
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginPage()
          : ProfilePage(),
    );
  }
}
