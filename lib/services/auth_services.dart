// @dart = 2.9

import 'package:chop_kenkey/screens/dashboard.dart';
import 'package:chop_kenkey/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Dashboard();
          } else {
            return const Login();
          }
        });
  }

  //To SignUp with Email & Password
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  //To signIn
  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithPhoneNumber(authCredential.toString());
  }

  //To signIn with OTP
  signInWithOTP(smsCode, verId){
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCredential);
  }

  //To signOut
  signOut() {
    FirebaseAuth.instance.signOut();
  }

}
