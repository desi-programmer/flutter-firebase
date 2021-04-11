import 'package:country_picker/country_picker.dart';
import 'package:firebase_auths/controller/auth/auth.dart';
import 'package:firebase_auths/pages/auth/reset_password.dart';
import 'package:firebase_auths/pages/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool phoneLogin = true;
  String countryCode = "+91";

  String email;
  String password;
  String phoneNumber;

  bool passwordVisible = true;

  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Desi Programmer",
        ),
      ),
      //
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Column(
            children: [
              //
              Image.asset(
                "assets/images/login.png",
                height: 180.0,
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              //
              Text(
                "Continue to Your Account",
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
              // input boxes
              phoneForm(),
              //
              emailForm(),
              //
              SizedBox(
                height: 12.0,
              ),
              //
              ElevatedButton(
                onPressed: () {
                  // display email login form
                  if (phoneLogin) {
                    setState(() {
                      phoneLogin = !phoneLogin;
                    });
                  } else {
                    // email form is visible
                    // validate values
                    if (emailFormKey.currentState.validate()) {
                      emailFormKey.currentState.save();

                      // call login
                      signInUserWithEmail(email, password, context);
                    }
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                        " ${phoneLogin ? "Use Email Instead" : "Login with Email"}"),
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
                ),
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              //
              // phone number login
              ElevatedButton(
                onPressed: () {
                  if (!phoneLogin) {
                    setState(() {
                      phoneLogin = !phoneLogin;
                    });
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "${phoneLogin ? "Continue With Phone" : "Use Number Instead"}",
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
                ),
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              //
              // google auth
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 28.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Continue With Google",
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
                ),
              ),
              //
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2.0,
                      ),
                    ),
                    Text("\tor\t"),
                    Expanded(
                      child: Divider(
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Create new Account",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      anonymousSignIn(context);
                    },
                    child: Text(
                      "Sign In Anonymously",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneForm() {
    return Visibility(
      visible: phoneLogin,
      child: Form(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      setState(() {
                        countryCode = "+" + country.phoneCode;
                      });
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    border: Border.all(
                      color: Colors.black45,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$countryCode",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            //
            SizedBox(
              width: 5.0,
            ),
            //
            Expanded(
              flex: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Your Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 20.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailForm() {
    return Visibility(
      visible: !phoneLogin,
      child: Form(
        key: emailFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
              ),
              style: TextStyle(
                fontSize: 18.0,
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
            //
            SizedBox(
              height: 12.0,
            ),
            //
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
              ),
              obscureText: passwordVisible,
              style: TextStyle(
                fontSize: 18.0,
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
            //
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text("Forgot Your Password ?"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
