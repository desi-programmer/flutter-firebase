import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //
  String email;

  //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back To Login",
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            color: Colors.grey[200],
                          ),
                          padding: EdgeInsets.all(
                            12.0,
                          ),
                          child: Icon(
                            Icons.refresh_outlined,
                            size: 64.0,
                          ),
                        ),
                      ),
                      //
                      SizedBox(
                        height: 12.0,
                      ),
                      //
                      Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontFamily: "lato",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      //
                      SizedBox(
                        height: 12.0,
                      ),
                      //
                      Text(
                        "You don't need to reset password if you have signed up using Phone Number \n In case You have used Google , Then try resetting your Google password !",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "lato",
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(
                    height: 12.0,
                  ),
                  //
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          )),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "lato",
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Send Reset Instructions",
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20.0,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(
                            fontSize: 20.0,
                            fontFamily: "lato",
                          ),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
