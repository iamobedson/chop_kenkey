
import 'package:chop_kenkey/menu_pages/settings.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
              fontFamily: 'Trueno',
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text("Our Privacy Policy"),
      ),
    );
  }
}
