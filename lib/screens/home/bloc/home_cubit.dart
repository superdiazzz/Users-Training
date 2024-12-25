
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_training/screens/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  final FirebaseAuth _auth;
  HomeCubit(this._auth) : super(HomeInitial());

  User? loginUser;

  Future<void> getCurrentUser() async {
    emit(HomeLoading());

    loginUser = _auth.currentUser;

    emit(HomeGetUser(loginUser));

  }

  void reloadImageEvent(){
    emit(ReloadImageState());
  }

}