import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/repositories/apps_repository.dart';
import 'package:personal_training/screens/commons/custom_dialog.dart';
import 'package:personal_training/screens/commons/custom_modal_bottom_sheet.dart';
import 'package:personal_training/screens/commons/toast_helper.dart';
import 'package:personal_training/screens/home/bloc/home_cubit.dart';
import 'package:personal_training/screens/home/home.dart';
import 'package:personal_training/screens/video_training/bloc/video_training_cubit.dart';
import 'package:personal_training/screens/video_training/bloc/video_training_state.dart';
import 'package:personal_training/screens/video_training/review_dialog.dart';
import 'package:personal_training/screens/video_training/start_workout_video.dart';
import 'package:personal_training/screens/video_training/update_user_status_modal.dart';

import '../../core/const/color_constant.dart';
import '../../core/const/data_constant.dart';
import '../../core/const/path_constant.dart';
import '../../core/const/text_constant.dart';
import '../../models/workout_model.dart';
import '../commons/fitness_button.dart';
import '../home/edit_user_status_modal.dart';
import '../home/workout_card.dart';

class VideoTraining extends StatelessWidget {
  const VideoTraining({super.key});

  static const String id = "video_training";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoTrainingCubit(RepositoryProvider.of<AppsRepository>(context)),
      child: BlocConsumer<VideoTrainingCubit, VideoState>(
        listener: (context, state) {

        },
        builder: (context, state) {

          final bloc = context.read<VideoTrainingCubit>();

          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: (state is VideoActiveNext ) ? FitnessButton(
                isEnabled: state.active,
                title: 'Complete',
                onTap: () async {
                  final result = await reviewDialog(context);

                  if(context.mounted ){
                    final result2 = await customModalBottomSheet(
                        context,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: UpdateUserStatusModal(bloc: bloc)
                    );
                    ToastHelper.showSuccess(description: 'Berhasil mengupdate kondisi terkini');
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  }
                },
              ) : FitnessButton(
                isEnabled: false,
                title: 'Complete',
                onTap: () async {
                  final result = await reviewDialog(context);

                  if(context.mounted){
                    final result2 = await customModalBottomSheet(
                        context,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: UpdateUserStatusModal(bloc: bloc)
                    );

                    ToastHelper.showSuccess(description: 'Berhasil mengupdate kondisi terkini');
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  }

                },
              ) ,
            ),
            body: StartWorkoutContent(),
          );
        },
      ),
    );
  }
}

class StartWorkoutContent extends StatefulWidget {
  const StartWorkoutContent({super.key});

  @override
  State<StartWorkoutContent> createState() => _StartWorkoutContentState();
}

class _StartWorkoutContentState extends State<StartWorkoutContent> {

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<VideoTrainingCubit>(context);

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
                  value: bloc.value1,
                  onChanged: (value) {
                    setState(() {
                      bloc.value1 = !bloc.value1;
                    });
                    bloc.updateTraining();
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
                  value: bloc.value2,
                  onChanged: (value) {
                    setState(() {
                      bloc.value2 = !bloc.value2;
                    });
                    bloc.updateTraining();
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

