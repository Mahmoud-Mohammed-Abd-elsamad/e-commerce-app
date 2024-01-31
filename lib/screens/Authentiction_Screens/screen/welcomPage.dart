// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';

import '../../../widegt/CustomarButton.dart';
import '../../../widegt/CustomarCricleAvater.dart';
import 'LoginPage.dart';


// ignore: must_be_immutable
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static String id = 'WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String imageBackgroundWelcome = 'assets/images/welcome1.png';
  Color grayColorCricle = Colors.grey;
  Color greenColorCricle = Colors.green;
  Color color1 = Colors.green;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imageBackgroundWelcome),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(
                    top: 50, bottom: 18, right: 26, left: 26),
                child: const Column(
                  children: [
                    Text(
                      'Welcome to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 35,
                        height: 1.19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/icons/1.png'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consetetur "
                  "sadipscing elitr, sed diam nonumy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(99, 83, 83, 83),
                  ),
                ),
              ),
              const Spacer(),
              CustomarCricleAvater(
                  color1: color1,
                  color2: color2,
                  color3: color3,
                  color4: color4),
              const SizedBox(height: 40),
              GestureDetector(
                child: const CustomarButton(
                  textButton: 'Get Started',
                ),
                onTap: () {
                  setStates();
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  void setStates() {
    return setState(
      () {
        if (imageBackgroundWelcome == 'assets/images/welcome1.png') {
          imageBackgroundWelcome = 'assets/images/welcome2.jpg';
          color1 = grayColorCricle;
          color2 = greenColorCricle;
          color3 = grayColorCricle;
          color4 = grayColorCricle;
        } else if (imageBackgroundWelcome ==
            'assets/images/welcome2.jpg') {
          imageBackgroundWelcome = 'assets/images/welcome3.png';
          color1 = grayColorCricle;
          color2 = grayColorCricle;
          color3 = greenColorCricle;
          color4 = grayColorCricle;
        } else if (imageBackgroundWelcome ==
            'assets/images/welcome3.png') {
          imageBackgroundWelcome = 'assets/images/welcome4.png';
          color1 = grayColorCricle;
          color2 = grayColorCricle;
          color3 = grayColorCricle;
          color4 = greenColorCricle;
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginPage.id, (route) => false);
        }
      },
    );
  }
}
