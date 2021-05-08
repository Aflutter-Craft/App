import 'package:aflutter_craft/models/models.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final contentProvider = StateNotifierProvider(
  (ref) => GenericNotifier(
    AssetImage("assets/images/default_content.jpg"),
  ),
);

final styleProvider = StateNotifierProvider(
  (ref) => GenericNotifier(
    AssetImage("assets/images/default_style.jpg"),
  ),
);

final resultProvider = StateNotifierProvider(
  (ref) => GenericNotifier(
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

// proivder to save some app state permanently to device
final sharedPrefsProvider = FutureProvider(
  (ref) async => await SharedPreferences.getInstance(),
);

// provider for cached images
final cacheProvider = Provider((ref) => DefaultCacheManager());

// provider for alpha value (default to 0.8)
// keep the value between 10 and 100 for aesthetic reasons (the label on the slider)
// should be divided by 100 when sending to API
final alphaProvider = StateNotifierProvider((ref) => GenericNotifier(80.0));
