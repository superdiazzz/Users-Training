import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_training/core/const/color_constant.dart';
import 'package:personal_training/models/category_model.dart';
import 'package:personal_training/models/user_status_model.dart';
import 'package:personal_training/repositories/apps_repository.dart';
import 'package:personal_training/screens/commons/custom_modal_bottom_sheet.dart';
import 'package:personal_training/screens/commons/toast_helper.dart';
import 'package:personal_training/screens/detail_training/detail_training.dart';
import 'package:personal_training/screens/home/bloc/home_cubit.dart';
import 'package:personal_training/screens/home/bloc/home_state.dart';
import 'package:personal_training/screens/home/edit_user_status_modal.dart';
import 'package:personal_training/screens/home/workout_card.dart';

import '../../constants.dart';
import '../../core/const/data_constant.dart';
import '../../core/const/text_constant.dart';
import '../../models/workout_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String id = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(FirebaseAuth.instance,
          RepositoryProvider.of<AppsRepository>(context)
      )..getCurrentUser(),
      child: Scaffold(
        body: Container(
          color: ColorConstant.homeBackgroundColor,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if(state is HomeUpdateStatus){
                ToastHelper.showSuccess(description: 'Status User berhasil di Update');
              }
              else if(state is HomeError){
                ToastHelper.showError(description: 'Terjadi kesalahan ${state.message}');
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: [
                    if(state is HomeGetUser)
                    _createProfileData(context, state.user!, state.uStatus, state.profileUrl),
                    const SizedBox(height: 16),
                    _createCategoryList(context, (selectedCategory) {

                    },),
                    const SizedBox(height: 16),
                    _createExercisesList(context, DataConstant.workouts),
                    const SizedBox(height: 25),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Widget _createProfileData(
      BuildContext context,
      User user,
      UserStatusModel? uStatus,
      String? photoUrl
      ) {
    // final User? user = FirebaseAuth.instance.currentUser;
    final bloc = BlocProvider.of<HomeCubit>(context);
    final displayName = user.displayName ?? "No Username";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        color: Color(0xffedebff),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  customModalBottomSheet(
                    context,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: EditUserStatusModal(bloc: bloc,)
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $displayName',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      TextConstant.checkActivity,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('24/05/2024')
                          ],
                        ),
                        SizedBox(
                          width: 260,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: Text('DOB',)),
                              Text(' : '),
                              Expanded(flex: 3, child: Text('Lubuk Sikaping', overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 260,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: Text('Height',)),
                              Text(' : '),
                              Expanded(flex: 3, child: Text('${uStatus?.height ?? ''}', overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 260,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: Text('Weight',)),
                              Text(' : '),
                              Expanded(flex: 3, child: Text('${uStatus?.weight ?? ''}', overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 260,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: Text('Blood Type',)),
                              Text(' : '),
                              Expanded(flex: 3, child: Text('${uStatus?.blood ?? ''}', overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text('Body Mass Index',),
                            Text('')
                          ],
                        )
                      ],
                    )


                  ],
                ),
              ),
              GestureDetector(
                child: (photoUrl == null || photoUrl.isEmpty)
                    ? SizedBox(height: 80, width: 80,
                      child: CircleAvatar(
                                    backgroundImage: const AssetImage("assets/images/profile.png"),
                                    radius: 60,
                                  ),
                    )
                    : SizedBox(height: 80, width: 80,
                      child: CircleAvatar(
                      backgroundImage: FileImage(File(photoUrl)),
                      radius: 60,),
                ),
                onTap: () async {
                  // Handle avatar tap
                  await _pickImageFromGallery(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery(BuildContext context) async{
    final retunedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(retunedImage != null && context.mounted){
      // final img = File(retunedImage.path);
      context.read<HomeCubit>().previewImage(retunedImage.path);
    }
  }

  Widget _createCategoryList(BuildContext context, Function(CategoryModel) onSelected ){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Daily Training For You',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'More',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Horizontal scrollable buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: buttonLabels.map((label) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: label.color,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Handle button press
                      onSelected(label);
                    },
                    child: Text(
                      label.title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createExercisesList(BuildContext context, List<WorkoutData> lsWorkout) {
    // return ListView.builder(
    //   itemCount: lsWorkout.length,
    //   itemBuilder: (context, index) {
    //     final data = lsWorkout[index];
    //     return WorkoutCard(
    //       color: ColorConstant.cardioColor,
    //       workout: data,
    //       onTap: () {
    //         Navigator.pushNamed(context, DetailTraining.id);
    //       },
    //     );
    //   },
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        WorkoutCard(
          color: ColorConstant.cardioColor,
          workout: DataConstant.homeWorkouts[0],
          onTap: () {
            Navigator.pushNamed(context, DetailTraining.id);
          },),
        WorkoutCard(
          color: ColorConstant.cardioColor,
          workout: DataConstant.homeWorkouts[1],
          onTap: () {
            Navigator.pushNamed(context, DetailTraining.id);
          },),
      ],
    );
  }
}
