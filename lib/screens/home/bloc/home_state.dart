import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_training/models/UserModel.dart';
import 'package:personal_training/models/user_status_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String message;
  HomeError(this.message);
}

class HomeListUsers extends HomeState {
  List<UserModel> lsUser;
  HomeListUsers(this.lsUser);
}

class HomeImageSaved extends HomeState {}

class HomeUpdateStatus extends HomeState {}

class HomeGetUser extends HomeState {
  User? user;
  UserStatusModel? uStatus;
  String? profileUrl;
  HomeGetUser(this.user, this.uStatus, this.profileUrl);
}

class HomeCurrentUser extends HomeState {
  User? user;
  UserModel? userDetail;
  HomeCurrentUser(this.user, this.userDetail);
}

class ReloadImageState extends HomeState {

}