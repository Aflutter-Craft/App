import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StyleStore extends HookWidget {
  StyleStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(),
      body: Container(),
    );
  }
}
