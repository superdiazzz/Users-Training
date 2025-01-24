
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_training/screens/welcome/bloc/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState>{
  final FirebaseAuth _auth;
  WelcomeCubit(this._auth) : super(WelcomeInitial());

  Future<void> getCurrentUser() async {
    emit(WelcomeLoading());

    try{

      final user = _auth.currentUser;
      await Future.delayed(Duration(seconds: 2));

      print('user -> $user');
      if(user == null){
        emit(WelcomeLogin());
      }else{
        emit(WelcomeHome());
      }
    }catch(e){
      WelcomeError(e.toString());
    }

  }

}