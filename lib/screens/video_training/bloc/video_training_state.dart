
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoActiveNext extends VideoState {
  bool active;
  VideoActiveNext(this.active);
}

class VideoError extends VideoState {
  String message;
  VideoError(this.message);
}