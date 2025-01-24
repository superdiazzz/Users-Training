
import 'package:flutter/material.dart';
import 'package:personal_training/screens/detail/detail.dart';
import 'package:personal_training/screens/forgetpass/forget.dart';
import 'package:personal_training/screens/home/home.dart';
import 'package:personal_training/screens/profile/profile.dart';
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
    case ProfilePage.id:
      return MaterialPageRoute(
        builder: (context) => ProfilePage(),
      );
    case DetailPage.id:
      return MaterialPageRoute(
        builder: (context) => DetailPage(),
      );
    case ForgetPage.id:
      return MaterialPageRoute(
        builder: (context) => ForgetPage(),
      );
    case HomePage.id:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => WelcomePage(),
      );
  }
}