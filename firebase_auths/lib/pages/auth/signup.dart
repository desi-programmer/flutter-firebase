import 'package:firebase_auths/controller/auth/auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email;
  String password;

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
            padding: const EdgeInsets.all(20.0),
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
                          Icons.person_add_alt_1_outlined,
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
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: "lato",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    //
                    // SizedBox(
                    //   height: 12.0,
                    // ),
                    //
                    // Text(
                    //   "You don't need to reset password if you have signed up using Phone Number \n In case You have used Google , Then try resetting your Google password !",
                    //   style: TextStyle(
                    //     fontSize: 16.0,
                    //     fontFamily: "lato",
                    //     color: Colors.grey[700],
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                // == email
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                        validator: (val) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val);
                          if (emailValid) {
                            return null;
                          } else {
                            return "Enter A Valid Email !";
                          }
                        },
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Choose A Password",
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
                        validator: (val) {
                          if (val.trim().length < 6) {
                            return "At least 6 characters required !";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // create a user with email and password
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        signUpUserWithEmail(email, password, context);
                      }
                    },
                    child: Text(
                      "Sign Up",
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
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(left: 10.0, right: 10.0),
                //         child: Divider(
                //           height: 36,
                //           thickness: 2.0,
                //         ),
                //       ),
                //     ),
                //     Text(
                //       "or",
                //       style: TextStyle(
                //         fontFamily: "regular",
                //       ),
                //     ),
                //     Expanded(
                //       child: Container(
                //           margin: EdgeInsets.only(left: 10.0, right: 10.0),
                //           child: Divider(
                //             height: 36,
                //             thickness: 2.0,
                //           )),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 15.0,
                // ),
                // InkWell(
                //   splashColor: Colors.transparent,
                //   highlightColor: Colors.transparent,
                //   onTap: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(6.0),
                //     child: Text(
                //       "Already Registered ? Login here",
                //       style: TextStyle(
                //         fontFamily: "lato",
                //         fontSize: 18.0,
                //         color: Colors.black87,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future signInWithPhone() async {
  //   //  number login
  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   await auth.verifyPhoneNumber(
  //     phoneNumber: '+' + countryCode + phoneNumber,
  //     timeout: Duration(seconds: 60),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // sign in the user
  //       await auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //     },
  //     codeSent: (String verificationId, int resendToken) async {
  //       // show Dialog
  //       await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 "Verify OTP",
  //                 style: TextStyle(fontSize: 22.0),
  //               ),
  //               SizedBox(
  //                 height: 10.0,
  //               ),
  //               TextField(
  //                 decoration: InputDecoration(
  //                   labelText: "OTP",
  //                 ),
  //                 style: TextStyle(
  //                   fontSize: 20.0,
  //                 ),
  //                 onChanged: (_val) {
  //                   setState(() {
  //                     codesent = _val;
  //                   });
  //                 },
  //               ),
  //               SizedBox(
  //                 height: 10.0,
  //               ),
  //               RaisedButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 shape: BeveledRectangleBorder(),
  //                 padding: EdgeInsets.symmetric(
  //                   horizontal: 25.0,
  //                   vertical: 10.0,
  //                 ),
  //                 child: Text("Confirm"),
  //                 color: Colors.greenAccent[700],
  //                 textColor: Colors.white,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );

  //       String smsCode = codesent;

  //       // Create a PhoneAuthCredential with the code
  //       PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
  //           verificationId: verificationId, smsCode: smsCode);

  //       try {
  //         await auth.signInWithCredential(phoneAuthCredential);
  //       } catch (e) {
  //         showDialog(
  //             context: context,
  //             builder: (context) => AlertDialog(
  //                   content: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Text("Error Logging In !"),
  //                       SizedBox(
  //                         height: 10.0,
  //                       ),
  //                       RaisedButton(
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                           return;
  //                         },
  //                         child: Text(
  //                           "Ok",
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ));
  //       }

  //       CollectionReference users =
  //           FirebaseFirestore.instance.collection('users');
  //       User user = FirebaseAuth.instance.currentUser;
  //       if (user != null) {
  //         var data = await users.doc(user.uid).get();
  //         if (data.exists) {
  //           // no user exists
  //           var userData = {
  //             'email': user.email,
  //             'id': user.uid,
  //             'phone': user.phoneNumber,
  //             'photoUrl': null,
  //           };
  //           users.doc(user.uid).update(userData);
  //         } else {
  //           var userData = {
  //             'email': user.email,
  //             'id': user.uid,
  //             'phone': user.phoneNumber,
  //             'photoUrl': null,
  //           };
  //           users.doc(user.uid).update(userData);
  //         }

  //         if (FirebaseAuth.instance.currentUser != null) {
  //           Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (context) => ProfileCreation(),
  //             ),
  //           );
  //         }
  //       }
  //     },
  //     codeAutoRetrievalTimeout: (
  //       String verificationId,
  //     ) {},
  //   );
  // }
}
