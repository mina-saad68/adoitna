import 'package:adoitna/firebase_options.dart';
import 'package:adoitna/outh/login_screen.dart';
import 'package:adoitna/outh/register_sccreen.dart';
import 'package:adoitna/ui/home/homeScreen.dart';
import 'package:adoitna/ui/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main  () async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        LoginScreen.routeName :(context) => LoginScreen(),
        RegisterScreen.routeName :(context) => RegisterScreen(),
      },

    );
  }
}