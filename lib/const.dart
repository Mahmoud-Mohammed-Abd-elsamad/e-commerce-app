// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

const Color color = Colors.lightGreen;
const Color colorBase = Color.fromARGB(255, 113, 203, 35);

const String avatarimg =
    'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=826&t=st=1693742378~exp=1693742978~hmac=ca46856e80fb9e2a6301fcc1696c5abc77091f6918d76107d0ab5ee5354df677';

final RegExp emailRegex = RegExp(
  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
);
final RegExp passwordRegex =
    RegExp(r'^(?=(.*[0-9]))((?=.*[A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z]))^.{8,}');

final RegExp phoneRegex = RegExp(r'^(?:[0]1)?[0-9]{11}$');

void hideKeybord(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

const String  favoritBoxs = "FAVORIT";
