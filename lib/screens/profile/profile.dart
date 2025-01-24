import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:personal_training/screens/commons/toast_helper.dart';
import 'package:personal_training/screens/profile/bloc/profile_cubit.dart';
import 'package:personal_training/screens/profile/bloc/profile_state.dart';
import 'package:personal_training/screens/sign_in/signin.dart';

import '../../core/const/color_constant.dart';
import '../../models/UserModel.dart';
import '../../repositories/apps_repository.dart';
import '../home/user_card.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  static const String id = "profile";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? userDetail;

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
          FirebaseAuth.instance,
          RepositoryProvider.of<AppsRepository>(context)
      )..getCurrentUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile User"),
        ),
        body: Container(
          color: ColorConstant.homeBackgroundColor,
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if(state is ProfileCurrentUser){
                userDetail = state.userDetail;
              }
              else if(state is ProfileError){
                ToastHelper.showError(description: state.message);
              }
              else if(state is ProfileLogout){
                Navigator.pushNamedAndRemoveUntil(context, SigninPage.id, (route) => false,);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is ProfileLoading,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if(userDetail != null)
                        UserCard(
                          imageFile: imageFile,
                          userDetail: userDetail!,
                          showUpload: true,
                          onpress: () async{

                          await _pickImageFromGallery(context);

                        },),
                      SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.all(16),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16), // Adjust border radius
                              ),
                            ),
                            onPressed: () async {
                                context.read<ProfileCubit>().logout();
                            },
                            child: Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future _cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        )
      ],
    );

    if(croppedFile != null){
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }

  }

  void _clearImage(){
    imageFile = null;
    setState(() {
      // free state
    });
  }

  Future _pickImageFromGallery(BuildContext context) async{
    final retunedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(retunedImage != null && context.mounted){
      imageFile = retunedImage != null ? File(retunedImage.path) : null;

      if(imageFile != null){
        _cropImage();
      }
      // if(imageFile != null){
      //   setState(() {
      //
      //   });
      // }
      //context.read<ProfileCubit>().previewImage(retunedImage.path);
    }
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
