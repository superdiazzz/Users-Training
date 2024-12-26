import 'package:flutter/material.dart';
import 'package:personal_training/screens/commons/custom_dialog.dart';
import 'package:personal_training/screens/video_training/review_dialog.dart';
import 'package:personal_training/screens/video_training/start_workout_video.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/data_constant.dart';
import '../../core/const/path_constant.dart';
import '../../core/const/text_constant.dart';
import '../../models/workout_model.dart';
import '../commons/fitness_button.dart';
import '../home/workout_card.dart';

class VideoTraining extends StatelessWidget {
  const VideoTraining({super.key});

  static const String id = "video_training";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FitnessButton(
          title: 'Complete',
          onTap: () {
            reviewDialog(context);
          },
        ),
      ),
      body: StartWorkoutContent(),
    );
  }
}

class StartWorkoutContent extends StatefulWidget {
  const StartWorkoutContent({super.key});

  @override
  State<StartWorkoutContent> createState() => _StartWorkoutContentState();
}

class _StartWorkoutContentState extends State<StartWorkoutContent> {

  bool value1 = false;
  bool value2 = false;

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
              const SizedBox(height: 23),
              Align(
                  alignment: Alignment.center,
                  child: Text('Part 1/5', style: TextStyle(color: Colors.grey),)
              ),
              const SizedBox(height: 23),
              ListTile(
                title: Text(
                'Pull up',
                  style: TextStyle(
                    color: ColorConstant.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
                ),
                subtitle: Text('10 Times'),
                trailing: Checkbox(
                  value: value1,
                  onChanged: (value) {
                    setState(() {
                      value1 = !value1;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                    'Pull up',
                    style: TextStyle(
                      color: ColorConstant.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                ),
                subtitle: Text('10 Times'),
                trailing: Checkbox(
                  value: value2,
                  onChanged: (value) {
                    setState(() {
                      value2 = !value2;
                    });
                  },
                ),
              ),


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
          Navigator.pop(context);
        },
      ),
    );
  }
}

