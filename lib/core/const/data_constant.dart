
import 'package:personal_training/core/const/path_constant.dart';
import 'package:personal_training/core/const/text_constant.dart';

import '../../models/exercise_model.dart';
import '../../models/workout_model.dart';

class DataConstant {
  // Onboarding
  // static final onboardingTiles = [
  //   OnboardingTile(
  //     title: TextConstant.onboarding1Title,
  //     mainText: TextConstant.onboarding1Description,
  //     imagePath: PathConstant.onboarding1,
  //   ),
  //   OnboardingTile(
  //     title: TextConstant.onboarding2Title,
  //     mainText: TextConstant.onboarding2Description,
  //     imagePath: PathConstant.onboarding2,
  //   ),
  //   OnboardingTile(
  //     title: TextConstant.onboarding3Title,
  //     mainText: TextConstant.onboarding3Description,
  //     imagePath: PathConstant.onboarding3,
  //   ),
  // ];

  // Workouts
  static final List<WorkoutData> workouts = [
    WorkoutData(
        title: TextConstant.yogaTitle,
        exercices: TextConstant.yogaExercises,
        minutes: TextConstant.yogaMinutes,
        currentProgress: 1,
        progress: 16,
        image: PathConstant.yoga,
        level: 'Super Easy',
        exerciseDataList: [
          ExerciseData(
            title: TextConstant.reclining,
            minutes: TextConstant.recliningMinutes,
            progress: 1,
            video: PathConstant.recliningVideo,
            description: TextConstant.warriorDescription,
            steps: [
              TextConstant.warriorStep1,
              TextConstant.warriorStep2,
              TextConstant.warriorStep1,
              TextConstant.warriorStep2,
              TextConstant.warriorStep1,
              TextConstant.warriorStep2,
            ],
          ),
          ExerciseData(
            title: TextConstant.cowPose,
            minutes: TextConstant.cowPoseMinutes,
            progress: 0.3,
            video: PathConstant.cowPoseVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.warriorPose,
            minutes: TextConstant.warriorPoseMinutes,
            progress: 0.99,
            video: PathConstant.warriorIIVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
        ]),
    WorkoutData(
        title: TextConstant.pilatesTitle,
        exercices: TextConstant.pilatesExercises,
        minutes: TextConstant.pilatesMinutes,
        currentProgress: 1,
        level: 'Medium',
        progress: 20,
        image: PathConstant.pilates,
        exerciseDataList: [
          ExerciseData(
            title: TextConstant.reclining,
            minutes: TextConstant.recliningMinutes,
            progress: 0.1,
            video: PathConstant.recliningVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.cowPose,
            minutes: TextConstant.cowPoseMinutes,
            progress: 0.1,
            video: PathConstant.cowPoseVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.warriorPose,
            minutes: TextConstant.warriorPoseMinutes,
            progress: 0.0,
            video: PathConstant.warriorIIVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
        ]),
    WorkoutData(
        title: TextConstant.fullBodyTitle,
        exercices: TextConstant.fullBodyExercises,
        minutes: TextConstant.fullBodyMinutes,
        currentProgress: 12,
        progress: 14,
        level: 'Medium',
        image: PathConstant.fullBody,
        exerciseDataList: [
          ExerciseData(
            title: TextConstant.reclining,
            minutes: TextConstant.recliningMinutes,
            progress: 0.99,
            video: PathConstant.recliningVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.cowPose,
            minutes: TextConstant.cowPoseMinutes,
            progress: 0.6,
            video: PathConstant.cowPoseVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.warriorPose,
            minutes: TextConstant.warriorPoseMinutes,
            progress: 0.8,
            video: PathConstant.warriorIIVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
        ]),
    WorkoutData(
      title: TextConstant.stretchingTitle,
      exercices: TextConstant.stretchingExercises,
      minutes: TextConstant.stretchingMinutes,
      currentProgress: 0,
      progress: 8,
      level: 'Hard',
      image: PathConstant.stretching,
      exerciseDataList: [
        ExerciseData(
          title: TextConstant.reclining,
          minutes: TextConstant.recliningMinutes,
          progress: 0.0,
          video: PathConstant.recliningVideo,
          description: TextConstant.warriorDescription,
          steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
        ),
        ExerciseData(
          title: TextConstant.cowPose,
          minutes: TextConstant.cowPoseMinutes,
          progress: 0.0,
          video: PathConstant.cowPoseVideo,
          description: TextConstant.warriorDescription,
          steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
        ),
        ExerciseData(
          title: TextConstant.warriorPose,
          minutes: TextConstant.warriorPoseMinutes,
          progress: 0.0,
          video: PathConstant.warriorIIVideo,
          description: TextConstant.warriorDescription,
          steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
        ),
      ],
    ),
  ];

  static final List<WorkoutData> homeWorkouts = [
    WorkoutData(
        title: TextConstant.cardioTitle,
        exercices: TextConstant.cardioExercises,
        minutes: TextConstant.cardioMinutes,
        currentProgress: 10,
        progress: 16,
        level: 'Hard',
        image: PathConstant.cardio,
        exerciseDataList: [
          ExerciseData(
            title: TextConstant.reclining,
            minutes: TextConstant.recliningMinutes,
            progress: 1,
            video: PathConstant.recliningVideo,
            description: TextConstant.warriorDescription,
            steps: [
              TextConstant.warriorStep1,
              TextConstant.warriorStep2,
              TextConstant.warriorStep1,
              TextConstant.warriorStep2,
              TextConstant.warriorStep1,
              TextConstant.warriorStep2,
            ],
          ),
          ExerciseData(
            title: TextConstant.cowPose,
            minutes: TextConstant.cowPoseMinutes,
            progress: 0.3,
            video: PathConstant.cowPoseVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.warriorPose,
            minutes: TextConstant.warriorPoseMinutes,
            progress: 0.99,
            video: PathConstant.warriorIIVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
        ]),
    WorkoutData(
        title: TextConstant.armsTitle,
        exercices: TextConstant.armsExercises,
        minutes: TextConstant.armsMinutes,
        currentProgress: 1,
        progress: 20,
        level: 'Super Easy',
        image: PathConstant.cardio,
        exerciseDataList: [
          ExerciseData(
            title: TextConstant.reclining,
            minutes: TextConstant.recliningMinutes,
            progress: 0.1,
            video: PathConstant.recliningVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.cowPose,
            minutes: TextConstant.cowPoseMinutes,
            progress: 0.1,
            video: PathConstant.cowPoseVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
          ExerciseData(
            title: TextConstant.warriorPose,
            minutes: TextConstant.warriorPoseMinutes,
            progress: 0.0,
            video: PathConstant.warriorIIVideo,
            description: TextConstant.warriorDescription,
            steps: [TextConstant.warriorStep1, TextConstant.warriorStep2],
          ),
        ]),
  ];

  // Reminder
  static List<String> reminderDays = [
    TextConstant.everyday,
    TextConstant.monday_friday,
    TextConstant.weekends,
    TextConstant.monday,
    TextConstant.tuesday,
    TextConstant.wednesday,
    TextConstant.thursday,
    TextConstant.friday,
    TextConstant.saturday,
    TextConstant.sunday,
  ];
}