import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitnessLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: Center(
        child: Theme(
          data: ThemeData(
            cupertinoOverrideTheme:
            CupertinoThemeData(brightness: Brightness.dark),
          ),
          child: CupertinoActivityIndicator(
            radius: 17,
          ),
        ),
      ),
    );
  }
}