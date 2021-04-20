import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final image;

  const ImageDetailScreen({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        content: Image(
          image: image,
        ),
      ),
    );
  }
}