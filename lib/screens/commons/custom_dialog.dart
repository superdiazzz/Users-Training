
import 'package:flutter/material.dart';

Future<dynamic> customDialog(
    BuildContext ctx,
    String title,
    String desc,
    String confirmText
    ){
  return showGeneralDialog(
    context: ctx,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(title),
          content: Text(desc),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(confirmText),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context, null);
              },
              child: const Text('Batal'),
            )
          ],
        ),
      );
    },
  );
}