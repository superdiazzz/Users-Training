abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  String message;
  SignUpError(this.message);
}

class SignUpSuccess extends SignUpState {}

class NextTabBarPageState extends SignUpState {}

class SignUpButtonEnableChangedState extends SignUpState {
  bool isEnabled;
  SignUpButtonEnableChangedState(this.isEnabled);
}