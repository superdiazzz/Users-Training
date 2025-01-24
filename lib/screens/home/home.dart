import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_training/core/const/color_constant.dart';
import 'package:personal_training/models/UserModel.dart';
import 'package:personal_training/repositories/apps_repository.dart';
import 'package:personal_training/screens/commons/toast_helper.dart';
import 'package:personal_training/screens/detail/detail.dart';
import 'package:personal_training/screens/home/bloc/home_cubit.dart';
import 'package:personal_training/screens/home/bloc/home_state.dart';
import 'package:personal_training/screens/home/list_tile_user.dart';
import 'package:personal_training/screens/home/user_card.dart';
import 'package:personal_training/screens/profile/profile.dart';

import '../../core/const/text_constant.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const String id = "home";

  List<UserModel>? users;
  UserModel? userDetail;
  TextEditingController inputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(FirebaseAuth.instance,
          RepositoryProvider.of<AppsRepository>(context)
      )..getCurrentUser()
      ..getListUser(),
      child: Scaffold(
        body: Container(
          color: ColorConstant.homeBackgroundColor,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if(state is HomeUpdateStatus){
                ToastHelper.showSuccess(description: 'Status User berhasil di Update');
              }
              else if(state is HomeCurrentUser){
                userDetail = state.userDetail;
              }
              else if(state is HomeError){
                ToastHelper.showError(description: 'Terjadi kesalahan ${state.message}');
              }
              else if(state is HomeListUsers){
                users = state.lsUser;
              }
              else if(state is HomeFilter){
                users = state.users;
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  children: [
                    if(userDetail != null)
                    UserCard(
                      userDetail: userDetail!,
                      showDescription: true,
                      showUpload: false, onpress: () {
                      Navigator.pushNamed(context, ProfilePage.id);
                    },),
                    //_createProfileData(context, userDetail!),
                    const SizedBox(height: 16),
                    if(users != null)
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: inputTextController,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            hintText: 'Cari User...',
                            prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.grey)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300)
                            )
                        ),
                        onSubmitted: (value) {
                          context.read<HomeCubit>().filterText(value);
                        },
                      ),
                    ),
                    if(users != null)
                    Expanded(
                      child: _createListUsers(context, users!),
                    ),
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

  Widget _createListUsers(BuildContext context, List<UserModel> users){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTileUser(
            onpress: () {
              Navigator.pushNamed(context, DetailPage.id, arguments: users[index].id);
            },
            image: users[index].avatar?? "",
            name: users[index].name??"",);
        },
      ),
    );
  }

  Widget _createProfileData(
      BuildContext context,
      UserModel userDetail
      ) {
    // final User? user = FirebaseAuth.instance.currentUser;
    // final bloc = BlocProvider.of<HomeCubit>(context);
    final displayName = userDetail.name ?? "No Username";
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
                  // customModalBottomSheet(
                  //   context,
                  //     height: MediaQuery.of(context).size.height * 0.65,
                  //     child: EditUserStatusModal(bloc: bloc,)
                  // );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("$photoUrl"),
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
                  ],
                ),
              ),
              GestureDetector(
                child: (userDetail.avatar == null || userDetail.avatar!.isEmpty)
                    ? Stack(
                  children: [
                    SizedBox(height: 80, width: 80,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage("assets/images/profile.png"),
                        radius: 60,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 0,
                      child: Icon(Icons.upload_rounded),
                    )
                  ],
                    )
                    : Stack(
                  children: [
                        SizedBox(height: 80, width: 80,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(userDetail.avatar!),
                            radius: 60,),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 0,
                          child: Icon(Icons.upload_rounded),
                        )
                      ],
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

}
