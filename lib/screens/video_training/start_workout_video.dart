import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../core/const/color_constant.dart';
import '../../models/exercise_model.dart';

class StartWorkoutVideo extends StatefulWidget {
  // final ExerciseData exercise;
  final Function(int) onPlayTapped;
  final Function(int) onPauseTapped;
  StartWorkoutVideo({
    super.key,
    // required this.exercise,
    required this.onPlayTapped,
    required this.onPauseTapped,
  });

  @override
  State<StartWorkoutVideo> createState() => _StartWorkoutVideoState();
}

class _StartWorkoutVideoState extends State<StartWorkoutVideo> {
  late VideoPlayerController _controller;
  late bool isPlayButtonHidden = false;
  late ChewieController _chewieController;
  Timer? timer;
  Timer? videoTimer;


  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/video/warrior.mp4"); //widget.exercise.video

    _controller.initialize();

    _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        autoPlay: false,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        aspectRatio: 15 / 10,
        placeholder: Center(child: CupertinoActivityIndicator()),
        materialProgressColors: ChewieProgressColors(playedColor: ColorConstant.primaryColor));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: _createVideoContainer());
  }

  Widget _createVideoContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Theme(data: Theme.of(context).copyWith(platform: TargetPlatform.android), child: Chewie(controller: _chewieController)),
    );
  }
}
