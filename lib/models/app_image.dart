import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppImage extends StateNotifier {
  AppImage(state) : super(state);
  void setImage(image) => state = image;
}
