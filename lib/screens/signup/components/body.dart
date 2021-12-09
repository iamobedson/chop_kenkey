import 'package:chop_kenkey/screens/signup/components/background.dart';
import 'package:flutter/material.dart';
import 'package:chop_kenkey/widgets/widgets.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: const [
                  Text(
                    "Sign up here",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Trueno',
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}