
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_training/screens/sign_up/bloc/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit() : super(SignUpInitial());

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

}