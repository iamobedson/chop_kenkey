import 'package:chop_kenkey/screens/screens.dart';
import 'package:chop_kenkey/services/auth_services.dart';
import 'package:chop_kenkey/widgets/custom_suffix_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

late String displayName, password, email;
late int phonenumber;
final formKey = GlobalKey<FormState>();

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNameFormField(),
          const SizedBox(height: 20),
          buildEmailFormField(),
          const SizedBox(height: 20),
          buildPasswordFormField(),
          const SizedBox(height: 20),
          buildPhoneFormField(),
          const SizedBox(height: 20),
          OutlinedButton(
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Trueno',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(width: 2, color: Colors.black54),
            ),
            onPressed: () {
              if (checkFields()) {
                AuthService().signUp(email, password).then((userCredentials) {
                  FirebaseFirestore.instance
                      .collection('UserData')
                      .doc(userCredentials.user.uid)
                      .set({
                    "email": userCredentials.user.email,
                    "uid": userCredentials.user.uid,
                    "phonenumber": userCredentials.user.phonenumber,
                  });
                  Navigator.of(context).pop();
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: "assets/icons/Mail.svg"),
        ),
        onChanged: (value) {
          email = value;
        },
        validator: (value) =>
            value!.isEmpty ? 'Email is required' : validateEmail(value));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: "assets/icons/Lock.svg"),
        ),
        onChanged: (value) {
          password = value;
        },
        validator: (value) => value!.isEmpty ? 'Password is required' : null);
  }

  TextFormField buildNameFormField() {
    return TextFormField(
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: "Name",
          hintText: "Enter Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: "assets/icons/User Icon.svg"),
        ),
        onChanged: (value) {
          displayName = value;
        },
        validator: (value) => value!.isEmpty ? 'Name is required' : null);
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: "Name",
          hintText: "Enter Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: "assets/icons/User Icon.svg"),
        ),
        onChanged: (value) {
          phonenumber = value as int;
        },
        validator: (value) =>
            value!.isEmpty ? 'Phonenumber is required' : null);
  }
}

//to check fields
checkFields() {
  final form = formKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  } else {
    return false;
  }
}

//to validate email
String? validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern.toString());
  if (!regex.hasMatch(value) || value == null) {
    return 'Enter valid Email';
  } else {
    return null;
  }
}
