
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_training/screens/profile/bloc/profile_state.dart';

import '../../../repositories/apps_repository.dart';

class ProfileCubit extends Cubit<ProfileState>{
  final FirebaseAuth _auth;
  final AppsRepository _appsRepository;

  ProfileCubit(this._auth, this._appsRepository) : super(ProfileInitial());

  User? loginUser;


  Future<void> getCurrentUser() async {
    emit(ProfileLoading());

    loginUser = _auth.currentUser;

    try{

      final userDetail = await _appsRepository.getUserDetail();
      emit(ProfileCurrentUser(userDetail));

    }catch(e){
      emit(ProfileError('Terjadi kendala: $e'));
    }
  }

  Future<void> previewImage(String img) async {
    //emit(ProfileLoading());

    emit(ProfileImageSaved(img));
  }

  Future<void> logout() async {
      try{
        emit(ProfileLoading());

        await Future.delayed(Duration(seconds: 2));
        await _auth.signOut();
        // cache data user will be deleted
        emit(ProfileLogout());

      }catch(e){
        emit(ProfileError('Terjadi kendala: $e'));
      }
  }

}