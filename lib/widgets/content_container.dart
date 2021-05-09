import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';

class ContentContainer extends ConsumerWidget {
  const ContentContainer({
    this.desc = "",
    Key? key,
    required this.content,
  }) : super(key: key);

  final content;
  final String desc;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    bool? isFirstTime = false;
    final prefProvider = watch(sharedPrefsProvider);

    // check if this is the first time launching
    // on this specific platform
    prefProvider.when(
      data: (sharedPref) {
        // if the key is set its not the first time
        // isFirstTime will be false
        if (sharedPref.containsKey("isFirstTime")) {
          isFirstTime = sharedPref.getBool("isFirstTime");
        } else {
          // if the key is not set then it is
          // the first time and we should show the tooltip
          // save the state to device and set isFirstTime to true
          sharedPref.setBool("isFirstTime", false);
          isFirstTime = true;
        }
      },
      loading: () => {},
      error: (err, stack) => {},
    );
    return ShowCaseWidget(
      autoPlay: false,
      autoPlayLockEnable: false,
      autoPlayDelay: Duration(seconds: 5),
      builder: Builder(
        builder: (context) {
          var _key = GlobalKey();
          var container = GenericContainer(
            image: content,
            ratio: isMobile ? 0.4 : 0.55,
          );
          // show the tooltip on first time app launch
          if (isFirstTime!) {
            showTooltip(context, [_key]);
            return Showcase(key: _key, description: desc, child: container);
          }
          return container;
        },
      ),
    );
  }
}
