import 'dart:ui';

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final image;
  final ratio;

  const ImageContainer({
    Key? key,
    this.image,
    this.ratio = 0.55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var conSize = size.height * ratio;

    return Container(
      width: conSize,
      height: conSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // simulate bottom elevation same as material button
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            spreadRadius: 0.0,
            offset: Offset(0, 6.0),
          )
        ],
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
