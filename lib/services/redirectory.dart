import 'package:chop_kenkey/screens/dashboard.dart';
import 'package:chop_kenkey/screens/login/login.dart';
import 'package:chop_kenkey/services/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Redirectory extends StatelessWidget {
  const Redirectory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder<Object?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return const Dashboard();
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                } else {
                  return const Login();
                }
              }),
        ),
      );
}
