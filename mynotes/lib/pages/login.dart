import 'package:flutter/material.dart';
import 'package:mynotes/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cover.png",
                    ),
                  ),
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 12.0,
              ),
              child: Text(
                "Create and Manage your Notes",
                style: TextStyle(
                  fontSize: 36.0,
                  fontFamily: "lato",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue With Google",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "lato",
                      ),
                    ),
                    //
                    SizedBox(
                      width: 10.0,
                    ),
                    //
                    Image.asset(
                      'assets/images/google.png',
                      height: 36.0,
                    ),
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey[700],
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    )),
              ),
            ),
            //
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
