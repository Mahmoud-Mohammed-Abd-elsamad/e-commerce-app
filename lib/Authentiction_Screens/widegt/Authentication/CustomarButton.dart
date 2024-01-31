// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

class CustomarButton extends StatelessWidget {
  const CustomarButton({super.key, required this.textButton});
  final String textButton;
  @override
  Widget build(BuildContext context) {
    var widthh = MediaQuery.sizeOf(context).width;
    // var heightt = MediaQuery.sizeOf(context).height;
    return Container(
      width: widthh,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 152, 230, 84),
            Color.fromARGB(255, 113, 203, 35),
            Color.fromARGB(255, 87, 178, 7),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text(
        textButton,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
