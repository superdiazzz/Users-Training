import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:personal_training/screens/video_training/video_training.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/path_constant.dart';
import '../../models/exercise_model.dart';
import '../../models/workout_model.dart';

class ExercisesList extends StatelessWidget {
  final WorkoutData workout;
  final List<ExerciseData> exercises;

  const ExercisesList({required this.exercises, required this.workout});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseCell(
          currentExercise: exercises[index],
          nextExercise: index == exercises.length - 1 ? null : exercises[index + 1],
          workout: workout,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
    );
  }
}

class ExerciseCell extends StatelessWidget {
  final WorkoutData workout;
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  const ExerciseCell({
    required this.currentExercise,
    required this.workout,
    required this.nextExercise,
  });

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {
        Navigator.pushNamed(context, VideoTraining.id);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 25, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.textBlack.withOpacity(0.12),
              blurRadius: 5.0,
              spreadRadius: 1.1,
            ),
          ],
        ),
        child: Row(
          children: [
            _createImage(),
            const SizedBox(width: 10),
            Expanded(
              child: _createExerciseTextInfo(),
            ),
            const SizedBox(width: 10),
            _createPlayButton(),
          ],
        ),
      ),
    );
  }

  Widget _createImage() {
    return Container(
      width: 75,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(workout.image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _createExerciseTextInfo() {
    final minutesStr = "${currentExercise.minutes} minutes";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentExercise.title,
          style: TextStyle(
            color: ColorConstant.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          minutesStr,
          style: TextStyle(
            color: ColorConstant.textBlack,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: LinearPercentIndicator(
            percent: currentExercise.progress,
            progressColor: ColorConstant.primaryColor,
            backgroundColor: ColorConstant.primaryColor.withOpacity(0.12),
            lineHeight: 6,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _createPlayButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}