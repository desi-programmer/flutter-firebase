import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auths/pages/auth/login.dart';
import 'package:firebase_auths/pages/profile/profile.dart';
import 'package:firebase_auths/pages/widgets/showAlert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

void anonymousSignIn(BuildContext context) async {
  try {
    UserCredential cred = await firebaseAuth.signInAnonymously();
    print(cred);

    if (FirebaseAuth.instance.currentUser.uid != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    }
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

void signUpUserWithEmail(
    String email, String password, BuildContext context) async {
  try {
    UserCredential credential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    print(credential);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    // print(e);
    // print(e.code);
    // print(e.message);

    switch (e.code) {
      case 'email-already-in-use':
        showCustomAlert(context, "ERROR", e.message);
        break;
      case 'weak-password':
        showCustomAlert(context, "ERROR", e.message);
        break;
      default:
        showCustomAlert(context, "ERROR", "Unexpected Error has Occured.");
        break;
    }
  }
}

void signInUserWithEmail(
    String email, String password, BuildContext context) async {
  try {
    UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    print(credential);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    // print(e);
    // print(e.code);
    // print(e.message);

    switch (e.code) {
      case 'user-not-found':
        showCustomAlert(context, "ERROR", e.message);
        break;
      case 'wrong-password':
        showCustomAlert(context, "ERROR", e.message);
        break;
      default:
        showCustomAlert(context, "ERROR", "Unexpected Error has Occured.");
        break;
    }
  }
}

void userLogout(BuildContext context) async {
  firebaseAuth.signOut();

  //
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
      (route) => false);
}
