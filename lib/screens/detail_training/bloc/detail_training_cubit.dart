
import 'package:bloc/bloc.dart';
import 'package:personal_training/screens/detail_training/bloc/detail_training_state.dart';

class DetailTrainingCubit extends Cubit<DetailTrainingState>{
  DetailTrainingCubit() : super(DetailTrainingInitial());

}