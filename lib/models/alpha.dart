import 'package:flutter_riverpod/flutter_riverpod.dart';

// used for the style and content trade-off provider
class Alpha extends StateNotifier {
  Alpha(state) : super(state);
  void setAlpha(alpha) => state = alpha;
}
