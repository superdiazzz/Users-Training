

import 'package:personal_training/models/UserModel.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLogout extends DetailState {}

class DetailUserFetched extends DetailState {
  UserModel user;
  DetailUserFetched(this.user);
}

class DetailError extends DetailState {
  String message;
  DetailError(this.message);
}