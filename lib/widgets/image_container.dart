import 'dart:ui';

import 'package:flutter/material.dart';

class ImageContainer extends StatefulWidget {
  final image;
  final bool isResult;

  const ImageContainer({
    Key? key,
    this.image,
    this.isResult = false,
  }) : super(key: key);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.55,
      height: size.height * 0.55,
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
          image: widget.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
