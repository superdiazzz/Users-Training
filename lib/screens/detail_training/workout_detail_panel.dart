import 'package:flutter/material.dart';

import '../../core/const/path_constant.dart';
import '../../core/const/text_constant.dart';
import '../../models/workout_model.dart';
import 'exercises_list.dart';


class WorkoutDetailsPanel extends StatelessWidget {
  final WorkoutData workout;

  WorkoutDetailsPanel({required this.workout});

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(height: 18),
        _createRectangle(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              // _createWorkoutData(),
              // SizedBox(height: 20),
              _createExerciesList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createRectangle() {
    return Image(image: AssetImage(PathConstant.rectangle));
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Beginner Hit Work For You',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text('10 Steps',style: TextStyle(color: Colors.grey),),
              SizedBox(width: 8),
              Icon(
                Icons.circle,
                size: 4,
                color: Colors.grey,
              ),
              SizedBox(width: 8),
              Text('1 Hour',style: TextStyle(color: Colors.grey),),

            ],
          )
        ],
      ),
    );
  }

  Widget _createExerciesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExercisesList(exercises: workout.exerciseDataList, workout: workout),
      ),
    );
  }
}