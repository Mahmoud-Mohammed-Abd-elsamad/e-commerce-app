// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

import '../../../const.dart';

class CustomarTextField extends StatelessWidget {
  const CustomarTextField({
    super.key,
    required this.namelabelTextField,
    required this.suffixIconlTextField,
    this.isHide,
    required this.typeKeyboard,
    this.customarOnchange,
    required this.regexEx,
  });
  final String namelabelTextField;
  final Widget suffixIconlTextField;
  final bool? isHide;
  final TextInputType typeKeyboard;
  final Function(String)? customarOnchange;
  final RegExp regexEx;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter your $namelabelTextField ';
        } else {
          if (!regexEx.hasMatch(value)) {
            if (regexEx == emailRegex) {
              return '$namelabelTextField invalid should be: example@hotmail.com';
            }
            //////////////////////////
            else if (regexEx == passwordRegex) {
              return 'invalid should be: A-z , 0-9 , 8-character';
            }
            //////////////////////////
            else if (regexEx == phoneRegex) {
              return '$namelabelTextField invalid should be: 11-number';
            }
          }
        }
        return null;
      },
      onChanged: customarOnchange,
      style: const TextStyle(
        fontSize: 19,
        color: Color.fromARGB(221, 33, 33, 33),
        fontWeight: FontWeight.w500,
      ),
      autocorrect: false,
      cursorHeight: 25,
      obscuringCharacter: '*',
      obscureText: isHide ?? false,
      enableSuggestions: false,
      cursorColor: colorBase,
      keyboardType: typeKeyboard,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        suffixIconColor: colorBase,
        suffixIcon: suffixIconlTextField,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(29),
            ),
            borderSide: BorderSide(
              color: colorBase,
            )),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBase,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            gapPadding: 20),
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        label: Text(
          namelabelTextField,
          style: const TextStyle(
            fontSize: 17,
            color: Color.fromARGB(195, 89, 188, 3),
            fontWeight: FontWeight.w500,
          ),
        ),
        hintText: namelabelTextField,
        hintStyle: const TextStyle(
          color: Color.fromARGB(207, 155, 153, 153),
          fontSize: 18,
        ),
      ),
    );
  }
}

// if (regexEx == RegExp(r'^(?=.*?[a-z])$')) {
//   return '$namelabelTextField invalid should be: (a-z) ';
// } else if (regexEx == RegExp(r'^(?=.*?[0-9])$')) {
//   return '$namelabelTextField invalid should be: (0-9)';
// } else if (regexEx == RegExp(r'^(?=.*?[@#+&*]$)')) {
//   return '$namelabelTextField invalid should be: (@ # & * +)';
// } else if (regexEx == RegExp(r'^(.{8,})$')) {
//   return '$namelabelTextField invalid should be: (more 8-character)';
// } else if (regexEx == RegExp(r'^(?=.*?[A-Z])$')) {
//   return '$namelabelTextField invalid should be: (A-Z) ';
// } else {

// if (regexEx == RegExp(r'^(?:[0]1)$')) {
//   return '$namelabelTextField invalid should be: 010 , 011 , 012';
// } else if (regexEx == RegExp(r'^.{11}$')) {
//   return '$namelabelTextField invalid should be: 11-number';
// } else {
