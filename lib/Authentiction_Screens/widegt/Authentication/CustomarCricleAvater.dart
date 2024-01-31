// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

class CustomarCricleAvater extends StatelessWidget {
  const CustomarCricleAvater({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
  });

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color1,
          radius: 5,
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: color2,
          radius: 5,
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: color3,
          radius: 5,
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: color4,
          radius: 5,
        ),
      ],
    );
  }
}
