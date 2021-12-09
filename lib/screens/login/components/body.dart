// ignore_for_file: prefer_const_constructors

import 'package:chop_kenkey/config/constants.dart';
import 'package:chop_kenkey/config/size_config.dart';
import 'package:chop_kenkey/menu_pages/settings.dart';
import 'package:chop_kenkey/widgets/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: const [
            Text(
              "Welcome Back",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Mulish-Black',
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sing in with your email and password \nor continue with a social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SignInForm(),
          ],
        ),
      ),
    ));
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 20),
          buildPasswordFormField(),
          const SizedBox(height: 20),
          OutlinedButton(
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Mulish',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.black54),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(SvgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: "assets/icons/Lock.svg")),
    );
  }
}
