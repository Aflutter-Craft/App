import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class AppImageProvider extends StateNotifier<AssetImage> {
  AppImageProvider(state) : super(state);
  void setImage(image) => state = image;
}

StateProvider contentProvider = StateProvider<AppImageProvider>(
  (ref) => AppImageProvider(
    AssetImage("assets/images/default_content.jpg"),
  ),
);
StateProvider styleProvider = StateProvider<AppImageProvider>(
  (ref) => AppImageProvider(
    AssetImage("assets/images/default_style.jpg"),
  ),
);
StateProvider resultProvider = StateProvider<AppImageProvider>(
  (ref) => AppImageProvider(
    AssetImage("assets/images/default_result.jpg"),
  ),
);
