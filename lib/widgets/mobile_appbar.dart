import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? mobileAppBar({label, context}) {
  return AppBar(
    title: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    leading: ModalRoute.of(context)?.canPop == true
        ? IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
            iconSize: 16,
          )
        : null,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    elevation: 0,
    backgroundColor: AppColors.accentColor,
    centerTitle: true,
    brightness: Brightness.dark,
  );
}
