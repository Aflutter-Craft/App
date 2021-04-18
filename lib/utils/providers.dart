import 'package:aflutter_craft/models/models.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final contentProvider = StateNotifierProvider(
  (ref) => AppImage(
    AssetImage("assets/images/default_content.jpg"),
  ),
);

final styleProvider = StateNotifierProvider(
  (ref) => AppImage(
    AssetImage("assets/images/default_style.jpg"),
  ),
);

final resultProvider = StateNotifierProvider(
  (ref) => AppImage(
    AssetImage("assets/images/default_result.jpg"),
  ),
);
