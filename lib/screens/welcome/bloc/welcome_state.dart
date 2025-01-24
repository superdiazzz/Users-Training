
import '../../../models/UserModel.dart';

abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class WelcomeLogin extends WelcomeState {}

class WelcomeHome extends WelcomeState {}


class WelcomeError extends WelcomeState {
  String message;
  WelcomeError(this.message);
}

class WelcomeCurrentUser extends WelcomeState {
  UserModel? userDetail;
  WelcomeCurrentUser(this.userDetail);
}