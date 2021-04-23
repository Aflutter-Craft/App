import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';

showImage({image, context}) async {
  await showDialog(
      barrierColor: Colors.black54,
      context: context,
      builder: (context) => ImageDetailScreen(image: image));
}
