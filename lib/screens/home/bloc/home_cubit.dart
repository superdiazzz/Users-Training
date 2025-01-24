
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_training/models/user_status_model.dart';
import 'package:personal_training/repositories/apps_repository.dart';
import 'package:personal_training/screens/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  final FirebaseAuth _auth;
  final AppsRepository _appsRepository;
  HomeCubit(this._auth, this._appsRepository) : super(HomeInitial());

  User? loginUser;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final bloodTypeController = TextEditingController();

  Future<void> getListUser() async {
    emit(HomeLoading());

    try{
      final list = await _appsRepository.getUsers();
      emit(HomeListUsers(list));
    }catch(e){
      emit(HomeError('Terjadi kendala: $e'));
    }
  }


  Future<void> getCurrentUser() async {
    emit(HomeLoading());

    loginUser = _auth.currentUser;

    //String? storedData = await _appsRepository.getStatus();

    // Check if data exists
    // UserStatusModel? st;
    // if (storedData != null) {
    //   print('isi data $storedData');
    //   try{
    //     var dt = jsonDecode(storedData);
    //     st = UserStatusModel(dt['height'].toString(), dt['weight'].toString(), dt['blood']);
    //   }catch(e){
    //     print('isu konversi $e');
    //   }
    // }
    //
    // String? imagePath = await _appsRepository.getImage();

    try{

      final userDetail = await _appsRepository.getUserDetail();
      emit(HomeCurrentUser(loginUser, userDetail));

    }catch(e){
      emit(HomeError('Terjadi kendala: $e'));
    }
  }

  Future<void> previewImage(String img) async{
    emit(HomeLoading());
    await _appsRepository.saveImage(img);
    emit(HomeImageSaved());
    await getCurrentUser();
  }

  void filterData(String categName){

  }

  void reloadImageEvent(){
    emit(ReloadImageState());
  }

}