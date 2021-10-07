// @dart = 2.9

// ignore_for_file: unnecessary_new, non_constant_identifier_names, sized_box_for_whitespace

import 'package:chop_kenkey/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String displayName, password, email;
int phonenumber;
var orangeColor = const Color(0xffe8730d);
final formKey = new GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  static const String routeName = "/signin";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SignUp(),
    );
  }
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionsReference =
      _firestore.collection("Users").doc("UserProfile").collection("Profile");
  final DocumentReference = CollectionsReference.doc('ProfileInfo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildSignupForm(),
        ),
      ),
    );
  }

  _buildSignupForm() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
          children: [
            const SizedBox(height: 75.0),
            Container(
                height: 125.0,
                width: 200.0,
                child: Stack(
                  children: [
                    const Text('Signup',
                        style: TextStyle(
                            fontFamily: 'Trueno',
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900)),
                    Positioned(
                        top: 45.0,
                        left: 188.0,
                        child: Container(
                            height: 15.0,
                            width: 15.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: orangeColor)))
                  ],
                )),
            const SizedBox(height: 55.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'NAME',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.8)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor),
                    )),
                onChanged: (value) {
                  displayName = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Name is required' : null),
            const SizedBox(height: 15.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.8)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor),
                    )),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Email is required' : validateEmail(value)),
            const SizedBox(height: 15.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.8)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor),
                    )),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Password is required' : null),
            const SizedBox(height: 15.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'PHONE NUMBER',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.8)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor),
                    )),
                onChanged: (value) {
                  phonenumber = phonenumber;
                },
                validator: (value) =>
                    value.isEmpty ? 'Phone Number is required' : null),
            const SizedBox(height: 50.0),
            GestureDetector(
              onTap: () {
                if (checkFields()) {
                  AuthService().signUp(email, password).then((userCreds) {
                    FirebaseFirestore.instance
                        .collection('UserData')
                        .doc(userCreds.user.uid)
                        .set({
                      "email": userCreds.user.email,
                      "uid": userCreds.user.uid,
                      "phonenumber": userCreds.user.phonenumber,
                    });
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Container(
                  height: 50.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      shadowColor: Colors.greenAccent,
                      color: orangeColor,
                      elevation: 7.0,
                      child: const Center(
                          child: Text('SIGN UP',
                              style: TextStyle(
                                fontFamily: 'Trueno',
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ))))),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Go Back',
                        style: TextStyle(
                            fontFamily: 'Trueno',
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline,
                            color: Colors.black)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

//to validate email
String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern.toString());
  if (!regex.hasMatch(value) || value == null) {
    return 'Enter valid Email';
  } else {
    return null;
  }
}

//to check fields
checkFields() {
  final form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  } else {
    return false;
  }
}
