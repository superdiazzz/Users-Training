import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/const/text_constant.dart';
import '../../models/UserModel.dart';


class UserCard extends StatelessWidget {
  final UserModel userDetail;
  final VoidCallback onpress;
  final File? imageFile;
  final bool showUpload;

  UserCard({super.key,
    required this.userDetail,
    required this.onpress,
    required this.showUpload,
    this.imageFile
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        color: Color(0xffedebff),
        child: InkWell(
          onTap: () {
            onpress();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("$photoUrl"),
                    Text(
                      'Hi, ${userDetail.name ?? "No Username"}',
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
                //(userDetail.avatar == null || userDetail.avatar!.isEmpty)
                imageFile == null
                    ? Stack(
                  children: [
                    SizedBox(height: 80, width: 80,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage("assets/images/profile.png"),
                        radius: 60,
                      ),
                    ),
                    if(showUpload)
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
                        backgroundImage: FileImage(imageFile!),//NetworkImage(userDetail.avatar!),
                        radius: 60,),
                    ),
                    if(showUpload)
                      Positioned(
                      bottom: 8,
                      right: 0,
                      child: Icon(Icons.upload_rounded),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
