import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String message;
  HomeError(this.message);
}

class HomeGetUser extends HomeState {
  User? user;
  HomeGetUser(this.user);
}

class ReloadImageState extends HomeState {

}