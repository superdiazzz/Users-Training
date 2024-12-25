import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/core/const/color_constant.dart';
import 'package:personal_training/screens/home/bloc/home_cubit.dart';
import 'package:personal_training/screens/home/bloc/home_state.dart';
import 'package:personal_training/screens/home/workout_card.dart';

import '../../constants.dart';
import '../../core/const/data_constant.dart';
import '../../core/const/text_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String id = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(FirebaseAuth.instance)..getCurrentUser(),
      child: Scaffold(
        body: Container(
          color: ColorConstant.homeBackgroundColor,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: [
                    if(state is HomeGetUser)
                    _createProfileData(context, state.user!),
                    const SizedBox(height: 16),
                    _createCategoryList(context),
                    const SizedBox(height: 16),
                    _createExercisesList(context),
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

  Widget _createProfileData(BuildContext context, User user) {
    // final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user.displayName ?? "No Username";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                  Row(
                    children: [
                      Text('DOB',),
                      Text('')
                    ],
                  ),
                  Row(
                    children: [
                      Text('Height',),
                      Text('')
                    ],
                  ),
                  Row(
                    children: [
                      Text('Weight',),
                      Text('')
                    ],
                  ),
                  Row(
                    children: [
                      Text('Blood Type',),
                      Text('')
                    ],
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
          GestureDetector(
            child: user.photoURL == null
                ? CircleAvatar(
              backgroundImage: const AssetImage("assets/images/profile.png"),
              radius: 60,
            )
                : CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            onTap: () async {
              // Handle avatar tap
            },
          ),
        ],
      ),
    );
  }

  Widget _createCategoryList(BuildContext context){
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
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text(
                      label,
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

  Widget _createExercisesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkoutCard(
          color: ColorConstant.cardioColor,
          workout: DataConstant.homeWorkouts[0],
          onTap: () {

          },),
        // Container(
        //   height: 160,
        //   child: ListView(
        //     scrollDirection: Axis.vertical,
        //     children: [
        //       const SizedBox(width: 20),
        //       WorkoutCard(
        //           color: ColorConstant.cardioColor,
        //           workout: DataConstant.homeWorkouts[0],
        //           onTap: () {
        //
        //           },),
        //           // onTap: () => Navigator.of(context).push(MaterialPageRoute(
        //           //     builder: (_) => WorkoutDetailsPage(
        //           //       workout: DataConstant.workouts[0],
        //           //     )))),
        //       const SizedBox(width: 15),
        //       WorkoutCard(
        //           color: ColorConstant.armsColor,
        //           workout: DataConstant.homeWorkouts[1],
        //           onTap: () {
        //
        //           }),
        //           // onTap: () => Navigator.of(context).push(MaterialPageRoute(
        //           //     builder: (_) => WorkoutDetailsPage(
        //           //       workout: DataConstant.workouts[2],
        //           //     )))),
        //       const SizedBox(width: 20),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
