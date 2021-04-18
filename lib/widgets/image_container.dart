import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:aflutter_craft/utils/theme.dart';

class ImageContainer extends StatefulWidget {
  final String imgPath;
  final String buttonText;
  final Function buttonFunc;
  final bool showBtn;

  const ImageContainer({
    Key key,
    this.imgPath,
    this.buttonText,
    this.buttonFunc,
    this.showBtn,
  }) : super(key: key);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Image(
                image: AssetImage(widget.imgPath),
                fit: BoxFit.fill,
                height: size.height * 0.55,
                width: size.height * 0.55,
              ),
            ),
          ),
          if (widget.showBtn)
            MaterialButton(
              onPressed: widget.buttonFunc,
              child: Text(widget.buttonText),
              textColor: Colors.white,
              color: AppColors.accentColor,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            )
        ],
      ),
    );
  }
}
