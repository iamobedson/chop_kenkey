// @dart = 2.9
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:chop_kenkey/services/auth_services.dart';
import 'package:chop_kenkey/widgets/avatar_image.dart';
import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const String routeName = "/profile";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => Profile(),
    );
  }

  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Profile'),
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250.0,
                      color: orangeColor,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 50.0,
                      right: 100.0,
                      child: Container(
                        height: 400.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.orange.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 200,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.orange.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 100,
                      right: 100,
                      child: Container(
                        height: 140,
                        width: 140,
                        child: ProfileImage(
                          //avatarUrl: ,
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                buildTextField('Full Name'),
                SizedBox(height: 10.0),
                buildTextField('E-Mail'),
                SizedBox(height: 10.0),
                buildTextField('Phone Number'),
                SizedBox(height: 40.0),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        child: Text(
                          'UPDATE',
                          style: TextStyle(
                              fontFamily: 'Trueno',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      OutlinedButton(
                        child: Text(
                          'SIGN OUT',
                          style: TextStyle(
                              fontFamily: 'Trueno',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          AuthService().signOut();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: orangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget buildTextField(String labelText) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5.0),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
