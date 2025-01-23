
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_training/repositories/apps_repository.dart';
import 'package:personal_training/screens/video_training/bloc/video_training_state.dart';

class VideoTrainingCubit extends Cubit<VideoState>{
  final AppsRepository _appsRepository;
  VideoTrainingCubit(this._appsRepository) : super(VideoInitial());

  bool value1 = false;
  bool value2 = false;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final bloodTypeController = TextEditingController();

  void updateTraining(){

    if(value1 && value2){
      emit(VideoActiveNext(true));
    }else{
      emit(VideoActiveNext(false));
    }
  }

  Future<void> saveStatus() async{
    var dt = {
      'height': heightController.text,
      'weight' : weightController.text,
      'blood' : bloodTypeController.text
    };
    _appsRepository.saveStatus(dt);
  }

}