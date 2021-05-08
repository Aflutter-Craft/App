// shows a snackbar with passed text
import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';

showToast({context, text}) {
  // calculate width according to device
  final width = isMobile
      ? MediaQuery.of(context).size.width * 0.9
      : MediaQuery.of(context).size.width * 0.3;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
        label: "Dismiss",
        textColor: Colors.white,
      ),
      elevation: 3,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      duration: Duration(seconds: 5),
      backgroundColor: AppColors.accentColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(text),
    ),
  );
}
