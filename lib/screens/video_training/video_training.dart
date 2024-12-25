import 'package:flutter/material.dart';
import 'package:personal_training/screens/video_training/start_workout_video.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/data_constant.dart';
import '../../core/const/path_constant.dart';
import '../../core/const/text_constant.dart';
import '../../models/workout_model.dart';
import '../home/workout_card.dart';

class VideoTraining extends StatelessWidget {
  const VideoTraining({super.key});

  static const String id = "video_training";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartWorkoutContent(),
    );
  }
}

class StartWorkoutContent extends StatelessWidget {
  const StartWorkoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.homeBackgroundColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createBackButton(context),
              const SizedBox(height: 23),
              _createVideo(context),


            ],
          ),
        ),
      ),
    );
  }

  Widget _createVideo(BuildContext context) {
    return Container(
      height: 264,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorConstant.white),
      child: StartWorkoutVideo(
        // exercise: exercise,
        onPlayTapped: (time) {
          // bloc.add(PlayTappedEvent(time: time));
        },
        onPauseTapped: (time) {
          // bloc.add(PauseTappedEvent(time: time));
        },
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: GestureDetector(
        child: Row(
          children: [
            Image(image: AssetImage(PathConstant.back)),
            const SizedBox(width: 17),
            Text(
              TextConstant.back,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onTap: () {
          // bloc.add(BackTappedEvent());
        },
      ),
    );
  }
}

