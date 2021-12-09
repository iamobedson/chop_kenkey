// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.SvgIcon,
  }) : super(key: key);

  final String SvgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
      child: SvgPicture.asset(
        SvgIcon,
        //height: 15,
      ),
    );
  }
}
