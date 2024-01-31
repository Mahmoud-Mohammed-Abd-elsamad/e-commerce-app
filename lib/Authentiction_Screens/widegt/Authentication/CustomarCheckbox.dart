// ignore_for_file: file_names, depend_on_referenced_packages
import 'package:flutter/material.dart';

import '../../../const.dart';

class CustomarCheckbox extends StatefulWidget {
  const CustomarCheckbox({super.key});

  @override
  State<CustomarCheckbox> createState() => _CustomarCheckboxState();
}

class _CustomarCheckboxState extends State<CustomarCheckbox> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: colorBase,
      shape: const CircleBorder(),
      value: rememberMe,
      onChanged: (value) {
        setState(() {
          rememberMe = value!;
        });
      },
    );
  }
}
