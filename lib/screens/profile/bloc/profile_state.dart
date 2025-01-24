
import '../../../models/UserModel.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLogout extends ProfileState {}

class ProfileError extends ProfileState {
  String message;
  ProfileError(this.message);
}

class ProfileImageSaved extends ProfileState {
  String path;
  ProfileImageSaved(this.path);
}

class ProfileCurrentUser extends ProfileState {
  UserModel? userDetail;
  ProfileCurrentUser(this.userDetail);
}