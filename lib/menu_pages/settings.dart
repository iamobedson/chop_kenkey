//@dart=2.9
import 'package:flutter/material.dart';
var orangeColor = const Color(0xffe8730d);

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: orangeColor,
      ),
    );
  }
}