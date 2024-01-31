import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../../../const.dart';
import '../../../widegt/Cusotmar_Messeage.dart';
import '../../../widegt/CustomarButton.dart';
import '../../../widegt/CustomarCheckbox.dart';
import '../../../widegt/CustomarTextfiled.dart';
import '../../HomeScrern/home_screen.dart';

import 'ForgetPassword.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  static String id = 'WelcomeLoginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static bool isShowL = true;
  bool _saving = false;
  double _hieght = .53, _bottom = 0;
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
                        'assets/images/backgggg.jpg',
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
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome back !',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          wordSpacing: 3,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const Text(
                        'Sign in to your account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color.fromARGB(195, 75, 75, 75),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // TextField email
                      CustomarTextField(
                        namelabelTextField: 'Email Address',
                        regexEx: emailRegex,
                        suffixIconlTextField: const Icon(CupertinoIcons.mail),
                        typeKeyboard: TextInputType.emailAddress,
                        customarOnchange: (data) {
                          RegisterPage.emailAddress = data;
                        },
                      ),

                      const SizedBox(height: 10),
                      // TextField password
                      CustomarTextField(
                        isHide: isShowL,
                        namelabelTextField: 'Password',
                        regexEx: passwordRegex,
                        suffixIconlTextField: isShowPasswordL(),
                        typeKeyboard: TextInputType.visiblePassword,
                        customarOnchange: (data) {
                          RegisterPage.password = data;
                        },
                      ),

                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomarCheckbox(),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color.fromARGB(195, 75, 75, 75),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, ForgetPasswordPage.id),
                            child: const Text(
                              'Forget Password ?',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Button
                      GestureDetector(
                          child: const CustomarButton(textButton: 'Log in'),
                          onTap: () async {
                            authLoginAccount();
                          }),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account ?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color.fromARGB(195, 75, 75, 75),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, RegisterPage.id),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      )
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

  authLoginAccount() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _saving = true;
      });
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: RegisterPage.emailAddress!,
          password: RegisterPage.password!,
        );
        hideKeybord(context);
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        });
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          hideKeybord(context);
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              message(
                context,
                textMessage: 'User not found',
                color: const Color.fromARGB(61, 187, 0, 0),
                textColor: const Color.fromARGB(225, 195, 0, 0),
              );
            });
          });
        } else if (ex.code == 'wrong-password') {
          hideKeybord(context);
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              message(
                context,
                textMessage: 'Wrong password',
                color: const Color.fromARGB(61, 187, 0, 0),
                textColor: const Color.fromARGB(225, 195, 0, 0),
              );
            });
          });
        }
      } catch (ex) {
        hideKeybord(context);
        Future.delayed(const Duration(seconds: 2), () {
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
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _saving = false;
        });
      });
    } else {
      setState(() {
        _bottom = -20;
        _hieght = .63;
      });
    }
  }

  IconButton isShowPasswordL() {
    return IconButton(
      icon: Icon(isShowL ? CupertinoIcons.lock : CupertinoIcons.lock_open),
      onPressed: () => setState(() {
        isShowL = !isShowL;
      }),
    );
  }
}
