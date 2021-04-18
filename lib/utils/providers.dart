import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class AppImageProvider extends StateNotifier {
  AppImageProvider(state) : super(state);
  void setImage(image) => state = image;
}

final contentProvider = StateNotifierProvider(
  (ref) => AppImageProvider(
    AssetImage("assets/images/default_content.jpg"),
  ),
);

final styleProvider = StateNotifierProvider(
  (ref) => AppImageProvider(
    AssetImage("assets/images/default_style.jpg"),
  ),
);

final resultProvider = StateNotifierProvider(
  (ref) => AppImageProvider(
    AssetImage("assets/images/default_result.jpg"),
  ),
);
