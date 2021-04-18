import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:aflutter_craft/utils/theme.dart';

class ImageContainer extends StatefulWidget {
  final String? imgPath;
  final String buttonText;
  final buttonFunc;
  final bool isResult;

  const ImageContainer({
    Key? key,
    @required this.imgPath,
    this.buttonText = "",
    this.buttonFunc,
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
          image: AssetImage(widget.imgPath ?? ""),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: !widget.isResult
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          if (!widget.isResult)
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
