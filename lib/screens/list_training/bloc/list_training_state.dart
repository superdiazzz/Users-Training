abstract class ListTrainingState {}

class ListTrainingInitial extends ListTrainingState {}

class ListTrainingLoading extends ListTrainingState {}

class ListTrainingError extends ListTrainingState {
  String message;
  ListTrainingError(this.message);
}