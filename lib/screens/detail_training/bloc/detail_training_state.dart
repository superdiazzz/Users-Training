abstract class DetailTrainingState {}

class DetailTrainingInitial extends DetailTrainingState {}

class DetailTrainingLoading extends DetailTrainingState {}

class DetailTrainingError extends DetailTrainingState {
  String message;
  DetailTrainingError(this.message);
}