
import 'package:flutter/material.dart';
import 'package:personal_training/screens/detail_training/detail_training.dart';
import 'package:personal_training/screens/home/home.dart';
import 'package:personal_training/screens/sign_in/signin.dart';
import 'package:personal_training/screens/sign_up/signup.dart';
import 'package:personal_training/screens/welcome/welcome.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case WelcomePage.id:
      return MaterialPageRoute(
        builder: (context) => WelcomePage(),
      );
    case SigninPage.id:
      return MaterialPageRoute(
        builder: (context) => SigninPage(),
      );
    case SignupPage.id:
      return MaterialPageRoute(
        builder: (context) => SignupPage(),
      );
    case HomePage.id:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    case DetailTraining.id:
      return MaterialPageRoute(
        builder: (context) => DetailTraining(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => WelcomePage(),
      );
  }
}