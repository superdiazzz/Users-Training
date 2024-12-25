import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/screens/sign_in/bloc/signin_cubit.dart';
import 'package:personal_training/screens/sign_in/bloc/signin_state.dart';
import 'package:personal_training/screens/sign_up/signup.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/text_constant.dart';
import '../../core/validation.dart';
import '../commons/fitness_button.dart';
import '../commons/fitness_loading.dart';
import '../commons/fitness_text_field.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  static const String id = "signin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<SignInCubit> _buildContext(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SignInContent();
        },
      ),
    );
  }
}

class SignInContent extends StatelessWidget {
  const SignInContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          _createMainData(context),
          BlocBuilder<SignInCubit, SignInState>(
            buildWhen: (_, currState) => currState is SignInLoading || currState is SignInError || currState is NextTabBarPageState,
            builder: (context, state) {
              if (state is SignInLoading) {
                return _createLoading();
              } else if (state is SignInError || state is NextTabBarPageState) {
                return SizedBox();
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: height - 30 - MediaQuery.of(context).padding.bottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _createHeader(),
              const SizedBox(height: 50),
              _createForm(context),
              const SizedBox(height: 20),
              _createForgotPasswordButton(context),
              const SizedBox(height: 40),
              _createSignInButton(context),
              Spacer(),
              _createDoNotHaveAccountText(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createLoading() {
    return FitnessLoading();
  }

  Widget _createHeader() {
    return Center(
      child: Text(
        TextConstant.signIn,
        style: TextStyle(
          color: Colors.black38,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignInCubit>(context);
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (_, currState) => currState is SignInError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FitnessTextField(
              title: TextConstant.email,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              placeholder: TextConstant.emailPlaceholder,
              controller: bloc.emailController,
              errorText: TextConstant.emailErrorText,
              isError: state is SignInError ? !ValidationService.email(bloc.emailController.text) : false,
              onTextChanged: () {
                //bloc.add(OnTextChangeEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstant.password,
              placeholder: TextConstant.passwordPlaceholderSignIn,
              controller: bloc.passwordController,
              errorText: TextConstant.passwordErrorText,
              isError: state is SignInError ? !ValidationService.password(bloc.passwordController.text) : false,
              obscureText: true,
              onTextChanged: () {
                // bloc.add(OnTextChangeEvent());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createForgotPasswordButton(BuildContext context) {
    final bloc = BlocProvider.of<SignInCubit>(context);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: Text(
          TextConstant.forgotPassword,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorConstant.primaryColor,
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
        //bloc.add(ForgotPasswordTappedEvent());
      },
    );
  }

  Widget _createSignInButton(BuildContext context) {
    final bloc = BlocProvider.of<SignInCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (_, currState) => currState is SignInButtonEnableChangedState,
        builder: (context, state) {
          return FitnessButton(
            title: TextConstant.signIn,
            isEnabled: state is SignInButtonEnableChangedState ? state.isEnabled : false,
            onTap: () {
              FocusScope.of(context).unfocus();
              //bloc.add(SignInTappedEvent());
            },
          );
        },
      ),
    );
  }

  Widget _createDoNotHaveAccountText(BuildContext context) {
    final bloc = BlocProvider.of<SignInCubit>(context);
    return Center(
      child: RichText(
        text: TextSpan(
          text: TextConstant.doNotHaveAnAccount,
          style: TextStyle(
            color: ColorConstant.textBlack,
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: " ${TextConstant.signUp}",
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignupPage.id);
                },
            ),
          ],
        ),
      ),
    );
  }
}
