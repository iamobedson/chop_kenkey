import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  Color orangeColor = const Color(0xffe8730d);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: orangeColor,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/profile_pic.jpeg'))),
          ),
          const Text(
            'Obed Osei-Nyansah',
            style: TextStyle(fontFamily: 'Trueno', color: Colors.white, fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
