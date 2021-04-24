import 'dart:ui';

import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final image;

  const ImageDetailScreen({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image(image: image),
        ),
      ),
    );
  }
}
