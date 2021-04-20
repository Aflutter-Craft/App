import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DesktopCommunity extends HookWidget {
  DesktopCommunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(context: context, label: "Community"),
      body: Center(
        child: Text(
          "Coming Soon...",
          style: TextStyle(
            fontSize: 34,
          ),
        ),
      ),
    );
  }
}
