import 'package:chop_kenkey/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chop_kenkey/services/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const Login(),
    );
  }

  const Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  //google sign in
  GoogleSignIn googleAuth = new GoogleSignIn();

  //store phonenumber to Firebase Cloud
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionsReference =
      _firestore.collection("Users").doc("UserProfile").collection("Profile");
  final DocumentReference = CollectionsReference.doc('ProfileInfo');

  late String phonenumber, verificationId, smsCode;
  bool codeSent = false;
  Color orangeColor = Color(0xffe8730d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Form(
          key: formKey,
          child: _loginForm(),
        ),
      ),
    );
  }

  _loginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          const SizedBox(height: 75.0),
          codeSent ? Container(
              height: 155.0,
              width: 200.0,
              child: Stack(
                children: [
                  const Text('Enter',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w900,
                          fontSize: 60.0)),
                  const Positioned(
                      top: 50.0,
                      child: Text('OTP Code',
                          style: TextStyle(
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.w900,
                              fontSize: 60.0))),
                ],
              )) : Container(
              height: 155.0,
              width: 200.0,
              child: Stack(
                children: [
                  const Text('Hello',
                      style: TextStyle(
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w900,
                          fontSize: 75.0)),
                  const Positioned(
                      top: 60.0,
                      child: Text('There',
                          style: TextStyle(
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.w900,
                              fontSize: 75.0))),
                  Positioned(
                      top: 116.0,
                      left: 198.0,
                      child: Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: orangeColor)))
                ],
              )),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.all(10),
            child: codeSent
                ? OTPTextField(
              length: 6,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fieldWidth: 30,
              style: const TextStyle(fontSize: 20.0),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                verifyPin(pin);
              },
            )
                : IntlPhoneField(
              decoration: InputDecoration(
                  labelText: 'PHONE NUMBER',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.black.withOpacity(0.8)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: orangeColor),
                  )),
              initialCountryCode: 'GH',
              showCountryFlag: true,
              onChanged: (value) {
                setState(() {
                  phonenumber = value.completeNumber;
                });
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: GestureDetector(
              onTap: () {
                verifyPhone(phonenumber);
              },
              child: Container(
                  height: 50.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      shadowColor: Colors.greenAccent,
                      color: orangeColor,
                      elevation: 7.0,
                      child: const Center(
                          child: Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Trueno',
                                  fontWeight: FontWeight.w900))))),
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.orange,
              ),
              label: Text('Sign in with Google'),
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
          ),
          const SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('New Here ?'),
            const SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text('Register',
                    style: TextStyle(
                        color: orangeColor,
                        fontFamily: 'Trueno',
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline)))
          ]),
          Spacer()
        ]));
  }

  Future<void> verifyPhone(String phonenumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
      final snackBar = SnackBar(content: Text('Login Success'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      final snackBar = SnackBar(content: Text('{$authException.message}'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      verificationId = verId;
      setState(() {
        codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phonenumber,
        timeout: const Duration(seconds: 15),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<void> verifyPin(String pin) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: pin);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      final snackBar = SnackBar(content: Text('Login Success'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch(e){
      final snackBar = SnackBar(content: Text("${e.message}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
