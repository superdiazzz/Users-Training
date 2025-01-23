import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:personal_training/screens/home/bloc/home_cubit.dart';
import 'package:personal_training/screens/video_training/bloc/video_training_cubit.dart';

import '../commons/fitness_button.dart';
import '../commons/fitness_text_field.dart';


class UpdateUserStatusModal extends StatefulWidget {
  final VideoTrainingCubit bloc;
  const UpdateUserStatusModal({
    super.key,
    required this.bloc
  });

  @override
  State<UpdateUserStatusModal> createState() => _UpdateUserStatusModalState();
}

class _UpdateUserStatusModalState extends State<UpdateUserStatusModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 40,
                  child: BackButton(),
                ),
                Text(
                  "Status Anda",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 16), //25/12/2024 - 07:55 AM
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              createCurrentDate(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FitnessTextField(
            title: "Height",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            placeholder: "170",
            controller: widget.bloc.heightController,
            errorText: "",
            onTextChanged: () {

            },
          ),
          const SizedBox(height: 8),
          FitnessTextField(
            title: "Weight",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            placeholder: "64",
            controller: widget.bloc.weightController,
            errorText: "",
            onTextChanged: () {

            },
          ),
          const SizedBox(height: 8),
          FitnessTextField(
            title: "Blood Type",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            placeholder: "O",
            controller: widget.bloc.bloodTypeController,
            errorText: "",
            onTextChanged: () {

            },
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FitnessButton(
              title: "Finish!",
              isEnabled: true,
              onTap: () async{
                FocusScope.of(context).unfocus();
                await widget.bloc.saveStatus();
                if(context.mounted){
                  Navigator.pop(context);
                }
                //bloc.add(SignInTappedEvent());
                // await bloc.sigin();
              },
            ),
          )

        ],
      ),
    );
  }

  String createCurrentDate(){
    DateTime now = DateTime.now();
    return DateFormat('dd/MM/yyyy - hh:mm a').format(now);
  }
}
