import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/screens/commons/toast_helper.dart';
import 'package:personal_training/screens/home/home.dart';
import 'package:personal_training/screens/sign_in/signin.dart';
import 'package:personal_training/screens/welcome/bloc/welcome_cubit.dart';
import 'package:personal_training/screens/welcome/bloc/welcome_state.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const String id = "welcome";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(FirebaseAuth.instance)
        ..getCurrentUser(),
      child: Scaffold(
        body: BlocConsumer<WelcomeCubit, WelcomeState>(
          listener: (context, state) {
            if(state is WelcomeHome){
              Navigator.pushReplacementNamed(context, HomePage.id);
            }
            else if(state is WelcomeLogin){
              Navigator.pushReplacementNamed(context, SigninPage.id);
            }
            else if(state is WelcomeError){
              ToastHelper.showError(description: state.message);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(child: Text(
                'User\'s Training \n App!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),)),
            );
          }
        ),
      ),
    );
  }
}
