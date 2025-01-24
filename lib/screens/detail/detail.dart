import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:personal_training/screens/detail/bloc/detail_cubit.dart';
import 'package:personal_training/screens/detail/bloc/detail_state.dart';

import '../../core/const/color_constant.dart';
import '../../models/UserModel.dart';
import '../home/user_card.dart';


class DetailPage extends StatelessWidget {
  final String idUser;
  DetailPage({
    super.key,
    required this.idUser
  });

  static const String id = "detail";

  UserModel? userDetail;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit(FirebaseFirestore.instance)..getUser(idUser),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail User"),
        ),
        body: BlocConsumer<DetailCubit, DetailState>(
          listener: (context, state) {
            if(state is DetailUserFetched){
              userDetail = state.user;
            }

          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is DetailLoading,
              child: Container(
                color: ColorConstant.homeBackgroundColor,
                child: Column(
                  children: [
                    if(userDetail != null)
                      UserCard(
                        imageFile: null,
                        userDetail: userDetail!,
                        showUpload: false,
                        showDescription: false,
                        onpress: () async{},
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
