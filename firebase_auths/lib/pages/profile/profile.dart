import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auths/controller/auth/auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Profile !",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${FirebaseAuth.instance.currentUser.isAnonymous ? "Anonymous User" : "Normla User"}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              "${FirebaseAuth.instance.currentUser.uid}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            //
            ElevatedButton(
              onPressed: () {
                userLogout(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Logout"),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.logout,
                  ),
                ],
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 20.0,
                  ),
                  //
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.redAccent[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
