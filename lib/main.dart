import 'package:adoitna/ui/home/homeScreen.dart';
import 'package:adoitna/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main  (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,


      routes: {
        SplashScreen.routeName :(context) => SplashScreen(),
        HomeScreen.routeName :(context) => HomeScreen(),
      },

    );
  }
}