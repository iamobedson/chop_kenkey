// @dart = 2.9

import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  static const String routeName = "/reset";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => Reset(),
    );
  }

  const Reset({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
