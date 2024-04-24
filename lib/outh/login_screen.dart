import 'dart:ui';

import 'package:adoitna/firebase/firebase_functions.dart';
import 'package:adoitna/outh/register_sccreen.dart';
import 'package:adoitna/ui/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginscreen';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff005277),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
                ),
                Center(
                  child: Text(
                    'Adoeitna',
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Welcome Back To Adoeitna ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Please Sigin With Your Email ',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text(
                      textAlign: TextAlign.end,
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xff005277),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          FirebaseFunction.login(emailController.text,
                              passwordController.text, () {
                            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                              }, (message) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Error',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      content: Text(message),
                                      actions: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text(
                                            'Ok',
                                            style: TextStyle(
                                                color: Color(0xFF5D9CEC),
                                                fontSize: 16),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                        }
                      },
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Do not have account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      child: const Text(
                        'Create Acount',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}


