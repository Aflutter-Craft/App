import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'package:aflutter_craft/models/models.dart';
import 'package:aflutter_craft/utils/utils.dart';

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

// provider for a given category
final fileProvider = FutureProvider.autoDispose.family((ref, category) async {
  return getImagesList(category: category);
});

// create providers for each style image category (14 providers)
final styleImagesProviders = Categories.values
    .map((category) => fileProvider(category.toShortString()))
    .toList();
