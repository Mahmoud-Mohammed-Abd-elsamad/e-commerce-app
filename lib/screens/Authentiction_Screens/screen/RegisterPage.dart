// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../const.dart';
import '../../../widegt/Cusotmar_Messeage.dart';
import '../../../widegt/CustomarButton.dart';
import '../../../widegt/CustomarTextfiled.dart';
import '../../HomeScrern/home_screen.dart';


class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';
  static String? emailAddress, password, phoneNumber;

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static bool isShowR = true;
  bool _saving = false;
  double _hieght = .55, _bottom = 0;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var widthh = MediaQuery.sizeOf(context).width;
    var heightt = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        blur: 3,
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: heightt * .59,
                  width: widthh,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        'assets/images/Background/login2.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: widthh * .2),
                    const Text(
                      'Welocme',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: _bottom,
                height: heightt * _hieght,
                width: widthh,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xffF4F5F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          wordSpacing: 3,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const Text(
                        'Quickly create account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color.fromARGB(195, 75, 75, 75),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // TextField phone
                      CustomarTextField(
                        namelabelTextField: 'Phone',
                        regexEx: phoneRegex,
                        suffixIconlTextField: const Icon(CupertinoIcons.phone),
                        typeKeyboard: TextInputType.phone,
                        customarOnchange: (data) {
                          RegisterPage.phoneNumber = data;
                        },
                      ),
                      const SizedBox(height: 10),
                      //TextField email
                      CustomarTextField(
                        namelabelTextField: 'Email Address',
                        suffixIconlTextField: const Icon(CupertinoIcons.mail),
                        typeKeyboard: TextInputType.emailAddress,
                        regexEx: emailRegex,
                        customarOnchange: (data) {
                          RegisterPage.emailAddress = data;
                        },
                      ),
                      const SizedBox(height: 10),
                      //TextField password
                      CustomarTextField(
                        isHide: isShowR,
                        namelabelTextField: 'Password',
                        suffixIconlTextField: isShowPasswordR(),
                        regexEx: passwordRegex,
                        typeKeyboard: TextInputType.visiblePassword,
                        customarOnchange: (data) {
                          RegisterPage.password = data;
                        },
                      ),
                      const SizedBox(height: 10),
                      //Button
                      GestureDetector(
                        onTap: () async {
                          authRegisterAccount();
                        },
                        child: const CustomarButton(textButton: 'Sign up'),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color.fromARGB(195, 75, 75, 75),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  authRegisterAccount() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _saving = true;
      });
      try {
        UserCredential user =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: RegisterPage.emailAddress!,
          password: RegisterPage.password!,
        );
        // ignore: use_build_context_synchronously
        hideKeybord(context);
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        });
      } on FirebaseException catch (ex) {
        if (ex.code == 'weak-password') {
          // ignore: use_build_context_synchronously
          hideKeybord(context);
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              message(
                context,
                textMessage: "weak password ",
                color: const Color.fromARGB(61, 187, 0, 0),
                textColor: const Color.fromARGB(225, 195, 0, 0),
              );
            });
          });
        } else if (ex.code == 'email-already-in-use') {
          hideKeybord(context);
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              message(
                context,
                textMessage: 'email already in use',
                color: const Color.fromARGB(61, 187, 0, 0),
                textColor: const Color.fromARGB(225, 195, 0, 0),
              );
            });
          });
        }
      } catch (ex) {
        hideKeybord(context);
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            message(
              context,
              textMessage: ex.toString(),
              color: const Color.fromARGB(61, 187, 0, 0),
              textColor: const Color.fromARGB(225, 195, 0, 0),
            );
          });
        });
      }
      hideKeybord(context);
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _saving = false;
        });
      });
    } else {
      setState(() {
        _bottom = -20;
        _hieght = .7;
      });
    }
  }

  IconButton isShowPasswordR() {
    return IconButton(
      icon: Icon(isShowR ? CupertinoIcons.lock : CupertinoIcons.lock_open),
      onPressed: () => setState(() {
        isShowR = !isShowR;
      }),
    );
  }
}
