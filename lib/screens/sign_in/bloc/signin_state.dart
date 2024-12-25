
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  String message;
  SignInError(this.message);
}


class NextTabBarPageState extends SignInState {}

class SignInButtonEnableChangedState extends SignInState {
  bool isEnabled;
  SignInButtonEnableChangedState(this.isEnabled);
}