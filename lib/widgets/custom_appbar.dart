//@dart=2.9

import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: orangeColor,
      elevation: 0,
      title: Container(
        //color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Trueno',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
