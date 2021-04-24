import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? mobileAppBar({label}) {
  return AppBar(
    title: Text(label),
    elevation: 0,
    backgroundColor: AppColors.backgroundCol,
    centerTitle: true,
  );
}
