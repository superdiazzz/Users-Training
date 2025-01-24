
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_training/models/UserModel.dart';
import 'package:personal_training/screens/detail/bloc/detail_state.dart';

class DetailCubit extends Cubit<DetailState>{
  final FirebaseFirestore _firestore;
  DetailCubit(this._firestore) : super(DetailInitial());


  Future<void> getUser(String userId) async {
    try{
      emit(DetailLoading());

      final qs = await _firestore.collection('users')
          .doc(userId)
          .get();

      if(qs.exists){
        UserModel? user = UserModel.fromJson(qs.data()!, qs.id);
        emit(DetailUserFetched(user));

      }else{
        emit(DetailError("User tidak ada"));
      }
    }catch(e){
      emit(DetailError(e.toString()));
    }
  }


}