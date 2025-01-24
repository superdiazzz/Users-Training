import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/screens/home/bloc/home_cubit.dart';

import '../commons/fitness_button.dart';
import '../commons/fitness_text_field.dart';


class EditUserStatusModal extends StatefulWidget {
  final HomeCubit bloc;
  const EditUserStatusModal({
    super.key,
    required this.bloc
  });

  @override
  State<EditUserStatusModal> createState() => _EditUserStatusModalState();
}

class _EditUserStatusModalState extends State<EditUserStatusModal> {
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Last Updated 26 Dec 2024',
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
              title: "Simpan",
              isEnabled: true,
              onTap: () async{
                FocusScope.of(context).unfocus();
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
}
