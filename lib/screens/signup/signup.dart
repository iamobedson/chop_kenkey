// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, unnecessary_const
import 'package:chop_kenkey/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "/signup";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SignUp(),
    );
  }

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  Color orangeColor = const Color(0xffe8730d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      //backgroundColor: Colors.brown[100],
      body: const Body(),
    );
  }
}
