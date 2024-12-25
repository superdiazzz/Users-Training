import 'package:flutter/material.dart';
import 'package:personal_training/core/const/text_constant.dart';
import 'package:personal_training/screens/commons/fitness_button.dart';
import 'package:personal_training/screens/detail_training/workout_details_content.dart';
import 'package:personal_training/screens/video_training/video_training.dart';

import '../../core/const/data_constant.dart';

class DetailTraining extends StatelessWidget {
  const DetailTraining({super.key});

  static const String id = "detail_training";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FitnessButton(
          title: TextConstant.start,
          onTap: () {
              Navigator.pushNamed(context, VideoTraining.id);
          },
        ),
      ),
      body: WorkoutDetailsContent(workout: DataConstant.homeWorkouts[0],),
    );
  }
}
