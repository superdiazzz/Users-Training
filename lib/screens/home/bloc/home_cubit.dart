
import 'package:bloc/bloc.dart';
import 'package:personal_training/screens/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());

}