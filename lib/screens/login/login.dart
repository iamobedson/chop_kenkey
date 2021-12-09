// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, unnecessary_const
import 'package:chop_kenkey/screens/login/components/body.dart';
import 'package:flutter/material.dart';
import '../signup.dart';

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
  Color orangeColor = const Color(0xffe8730d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      backgroundColor: Colors.grey[200],
      body: const Body(),
    );
  }
}
