import 'package:flutter_riverpod/flutter_riverpod.dart';

// generic state class, used to track images and alpha
class GenericNotifier extends StateNotifier {
  GenericNotifier(state) : super(state);
  void setState(newState) => state = newState;
}
