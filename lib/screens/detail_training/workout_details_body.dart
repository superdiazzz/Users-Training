import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/constants.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/path_constant.dart';
import '../../models/workout_model.dart';

class WorkoutDetailsBody extends StatelessWidget {
  final WorkoutData workout;
  WorkoutDetailsBody({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstant.white,
      child: Stack(
        children: [
          _createImage(),
          _createBackButton(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    return Positioned(
      left: 20,
      top: 14,
      child: SafeArea(
        child: GestureDetector(
          child: Container(
            width: 30,
            height: 30,
            child: Image(
              image: AssetImage(PathConstant.back),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ),
    );
  }

  Widget _createImage() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image(
            image: AssetImage(workout.image),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 80,
          right: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: successColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Super Easy',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}