import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(context: context, label: "About"),
      body: Container(),
    );
  }
}
