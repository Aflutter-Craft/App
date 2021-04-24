import 'package:aflutter_craft/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkImageContainer extends StatelessWidget {
  final String? imgName;

  const NetworkImageContainer({Key? key, this.imgName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: BUCKET_PREFIX + imgName!,
        placeholder: (context, url) => SizedBox(
          height: height * 0.6,
          width: height * 0.6,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        imageBuilder: (context, imageProvider) => Container(
          width: height * 0.6,
          height: height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
