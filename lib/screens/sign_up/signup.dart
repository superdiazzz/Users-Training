import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/screens/commons/toast_helper.dart';
import 'package:personal_training/screens/home/home.dart';
import 'package:personal_training/screens/sign_in/signin.dart';
import 'package:personal_training/screens/sign_up/bloc/signup_cubit.dart';
import 'package:personal_training/screens/sign_up/bloc/signup_state.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/text_constant.dart';
import '../../core/validation.dart';
import '../commons/fitness_button.dart';
import '../commons/fitness_loading.dart';
import '../commons/fitness_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  
  static const String id = "signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<SignUpCubit> _buildContext(BuildContext context){
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if(state is SignUpSuccess){
            Navigator.pushReplacementNamed(context, HomePage.id);
          }
          else if(state is SignUpError){
            ToastHelper.showError(description: "${state.message}");
          }
        },
        builder: (context, state) {
          return SignUpContent();
        },
      ),
    );
  }
}

class SignUpContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstant.white,
        child: Stack(
          children: [
            _createMainData(context),
            BlocBuilder<SignUpCubit, SignUpState>(
              buildWhen: (_, currState) => currState is SignUpLoading || currState is NextTabBarPageState || currState is SignUpError,
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return _createLoading();
                } else if (state is NextTabBarPageState || state is SignUpError) {
                  return SizedBox();
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _createTitle(),
            // const SizedBox(height: 50),
            _createForm(context),
            const SizedBox(height: 40),
            _createSignUpButton(context),
            // Spacer(),
            const SizedBox(height: 40),
            _createHaveAccountText(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _createLoading() {
    return FitnessLoading();
  }

  Widget _createTitle() {
    return Text(
      TextConstant.signUp,
      style: TextStyle(
        color: ColorConstant.textBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (_, currState) => currState is SignUpError,
      builder: (context, state) {
        return Column(
          children: [
            FitnessTextField(
              title: TextConstant.username,
              placeholder: TextConstant.userNamePlaceholder,
              controller: bloc.userNameController,
              textInputAction: TextInputAction.next,
              errorText: TextConstant.usernameErrorText,
              isError: state is SignUpError ? !ValidationService.username(bloc.userNameController.text) : false,
              onTextChanged: () {
                bloc.onTextChangedEvent();
                // bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstant.email,
              placeholder: TextConstant.emailPlaceholder,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: bloc.emailController,
              errorText: TextConstant.emailErrorText,
              isError: state is SignUpError ? !ValidationService.email(bloc.emailController.text) : false,
              onTextChanged: () {
                bloc.onTextChangedEvent();
                // bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstant.password,
              placeholder: TextConstant.passwordPlaceholder,
              obscureText: true,
              isError: state is SignUpError ? !ValidationService.password(bloc.passwordController.text) : false,
              textInputAction: TextInputAction.next,
              controller: bloc.passwordController,
              errorText: TextConstant.passwordErrorText,
              onTextChanged: () {
                bloc.onTextChangedEvent();
                // bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstant.confirmPassword,
              placeholder: TextConstant.confirmPasswordPlaceholder,
              obscureText: true,
              isError: state is SignUpError ? !ValidationService.confirmPassword(bloc.passwordController.text, bloc.confirmPasswordController.text) : false,
              controller: bloc.confirmPasswordController,
              errorText: TextConstant.confirmPasswordErrorText,
              onTextChanged: () {
                bloc.onTextChangedEvent();
                // bloc.add(OnTextChangedEvent());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createSignUpButton(BuildContext context) {
    final bloc = BlocProvider.of<SignUpCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (_, currState) => currState is SignUpButtonEnableChangedState,
        builder: (context, state) {
          return FitnessButton(
            title: TextConstant.signUp,
            isEnabled: state is SignUpButtonEnableChangedState ? state.isEnabled : false,
            onTap: () async {
              FocusScope.of(context).unfocus();
              await bloc.signUp();
              // bloc.add(SignUpTappedEvent());
            },
          );
        },
      ),
    );
  }

  Widget _createHaveAccountText(BuildContext context) {
    final bloc = BlocProvider.of<SignUpCubit>(context);
    return RichText(
      text: TextSpan(
        text: TextConstant.alreadyHaveAccount,
        style: TextStyle(
          color: ColorConstant.textBlack,
          fontSize: 18,
        ),
        children: [
          TextSpan(
            text: " ${TextConstant.signIn}",
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
                // bloc.add(SignInTappedEvent());
              },
          ),
        ],
      ),
    );
  }
}

