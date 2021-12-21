import 'package:chop_kenkey/services/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/google.png",
            height: 25,
            width: 25,
          ),
          const SizedBox(width: 10),
          const Text(
            "Login with Google",
            style: TextStyle(
              fontFamily: 'Trueno',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onPressed: () => signInWithGoogle(),
    );
  }
}
