
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_training/repositories/auth_service.dart';
import 'package:personal_training/screens/sign_in/bloc/signin_state.dart';

import '../../../core/validation.dart';

class SignInCubit extends Cubit<SignInState>{
  SignInCubit() : super(SignInInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isButtonEnabled = false;


  void onTextChangedEvent(){
    if(isButtonEnabled != _checkIfSignInButtonEnabled()){
      isButtonEnabled = _checkIfSignInButtonEnabled();
      emit(SignInButtonEnableChangedState(isButtonEnabled));
    }
  }

  Future<void> sigin()async {
    if(_checkValidatorsOfTextField()){
      try{
        emit(SignInLoading());
        await AuthService.signIn(emailController.text, passwordController.text);
        emit(SignInSuccess());

      }catch(e){
        emit(SignInError('$e'));
      }
    }
  }

  bool _checkIfSignInButtonEnabled() {
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  bool _checkValidatorsOfTextField() {
    return ValidationService.email(emailController.text) && ValidationService.password(passwordController.text);
  }

}