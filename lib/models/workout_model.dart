
import 'exercise_model.dart';

class WorkoutData{
  final String title;
  final String exercices;
  final String minutes;
  final int currentProgress;
  final int progress;
  final String image;
  final String level;
  final List<ExerciseData> exerciseDataList;

  WorkoutData({
    required this.title,
    required this.exercices,
    required this.minutes,
    required this.currentProgress,
    required this.progress,
    required this.image,
    required this.level,
    required this.exerciseDataList,
  });

}