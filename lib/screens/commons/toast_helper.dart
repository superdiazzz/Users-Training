import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';


class ToastHelper {

  static void showError({
    required String description,

  }){
    toastification.show(
        type: ToastificationType.error,
        title: const Text('Kesalahan'),
        autoCloseDuration: const Duration(seconds: 5),
        description: RichText(text: TextSpan(text: '${description}', style: TextStyle(color: Colors.black)),),
        style: ToastificationStyle.flatColored
    );
  }

  static void showSuccess(
      {
        required String description,
      }){

    toastification.show(
        type: ToastificationType.success,
        title: const Text('Berhasil'),
        autoCloseDuration: const Duration(seconds: 5),
        description: RichText(text: TextSpan(text: '${description}', style: TextStyle(color: Colors.black)),),
        style: ToastificationStyle.flatColored
    );
  }

  // static void showSuccess(
  //     {
  //       required BuildContext context,
  //       required String title,
  //       required String description,
  //       Color primaryColor = Colors.greenAccent,
  //       Color secondaryColor = Colors.black,
  //       IconData icon = Icons.check,
  //       MotionToastPosition position = MotionToastPosition.top,
  //       AnimationType animationType = AnimationType.fromLeft,
  //       double width = 300,
  //       double height = 80,
  //     }){
  //
  //   MotionToast(
  //     icon:  icon,
  //     primaryColor:  primaryColor,
  //     secondaryColor: secondaryColor,
  //     title:  Text(title, style: const TextStyle(color: Colors.white),),
  //     description:  Text(description, style: const TextStyle(color: Colors.white),),
  //     width:  300,
  //     height:  80,
  //     animationType: AnimationType.fromLeft,
  //     position: MotionToastPosition.top,
  //   ).show(context);
  // }

}
