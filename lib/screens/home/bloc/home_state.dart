import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_training/models/user_status_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String message;
  HomeError(this.message);
}

class HomeImageSaved extends HomeState {}

class HomeUpdateStatus extends HomeState {}

class HomeGetUser extends HomeState {
  User? user;
  UserStatusModel? uStatus;
  String? profileUrl;
  HomeGetUser(this.user, this.uStatus, this.profileUrl);
}

class ReloadImageState extends HomeState {

}