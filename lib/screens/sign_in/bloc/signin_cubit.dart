
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_training/screens/sign_in/bloc/signin_state.dart';

class SignInCubit extends Cubit<SignInState>{
  SignInCubit() : super(SignInInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


}