
import 'package:bloc/bloc.dart';
import 'package:personal_training/screens/list_training/bloc/list_training_state.dart';

class ListTrainingCubit extends Cubit<ListTrainingState>{
  ListTrainingCubit() : super(ListTrainingInitial());

}