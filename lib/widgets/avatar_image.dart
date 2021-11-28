// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String avatarUrl;
  final Function()? onTap;

  const ProfileImage({required this.avatarUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: avatarUrl == null ? CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.white,
          child: Icon(Icons.photo_camera),
        ) : CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ),
    );
  }
}
