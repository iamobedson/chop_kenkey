// ignore_for_file: use_key_in_widget_constructors

import 'package:chop_kenkey/menu_pages/settings.dart';
import 'package:flutter/material.dart';

class SendFeedback extends StatefulWidget {
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: const Text(
          'Send Feedback',
          style: TextStyle(
              fontFamily: 'Trueno',
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text("Send Feedback Page"),
      ),
    );
  }
}
