import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? mobileAppBar({label, context}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(40),
    child: AppBar(
      title: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0,
      backgroundColor: AppColors.accentColor,
      centerTitle: true,
      leading: ModalRoute.of(context)?.canPop == true
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
              iconSize: 18,
            )
          : null,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
