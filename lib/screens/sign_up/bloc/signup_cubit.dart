
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_training/repositories/auth_service.dart';
import 'package:personal_training/screens/sign_up/bloc/signup_state.dart';

import '../../../core/validation.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit() : super(SignUpInitial());

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  Future<void> signUp() async {
    if(checkValidatorsOfTextField()){

      emit(SignUpLoading());
      await AuthService.signUp(emailController.text, passwordController.text, userNameController.text);
      emit(SignUpSuccess());
    }else{
      emit(SignUpError('Input tidak valid'));
    }
  }

  void onTextChangedEvent(){
    if(isButtonEnabled != checkIfSignUpButtonEnabled()){
      isButtonEnabled = checkIfSignUpButtonEnabled();
      emit(SignUpButtonEnableChangedState(isButtonEnabled));
    }
  }

  bool checkIfSignUpButtonEnabled() {
    return userNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  bool checkValidatorsOfTextField() {
    return ValidationService.username(userNameController.text) &&
        ValidationService.email(emailController.text) &&
        ValidationService.password(passwordController.text) &&
        ValidationService.confirmPassword(passwordController.text, confirmPasswordController.text);
  }

}