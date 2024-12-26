
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> reviewDialog(
    BuildContext ctx,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              const Text(
                'Give Your Feedback',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Placeholder for the circle (icon/avatar)
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black26,
              ),
              const SizedBox(height: 24),

              // Feedback options as buttons
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'Easy',
                  'Nice',
                  'So hard',
                  'Difficult',
                  'Recommended',
                  'Programs its too hard',
                ].map((feedback) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Handle feedback button press
                      Navigator.pop(context);
                    },
                    child: Text(
                      feedback,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    },
  );
}