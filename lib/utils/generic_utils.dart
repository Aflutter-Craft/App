// shows a snackbar with passed text

import 'package:aflutter_craft/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

showToast({context, text}) {
  // calculate width according to device
  final width = isMobile
      ? MediaQuery.of(context).size.width * 0.9
      : MediaQuery.of(context).size.width * 0.3;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
        label: "Dismiss",
        textColor: Colors.white,
      ),
      elevation: 3,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      duration: Duration(seconds: 5),
      backgroundColor: AppColors.accentColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(text),
    ),
  );
}

// the main event of this app
styleTransfer(watch) async {
  final content = watch(contentProvider);
  final style = watch(styleProvider);
  final alpha = watch(alphaProvider);

  // get content image path
  final contentPath = content.file.path;
  // get style image path depending on local or not
  final stylePath = style is FileImage
      ? style.file.path
      : style.url.split('/').skip(4).take(5).join("/");

  // the API URL
  final url = Uri.parse(API_ENDPOINT);

  var formData = FormData.fromMap({
    'alpha': alpha / 100, // scale back alpha value
    'content_img': await MultipartFile.fromFile(contentPath),
  });

  // check if the style is local file
  // in that case add it to request files
  // otherwise pass it as style_path
  style is FileImage
      ? formData.files.add(
          MapEntry(
            'style_img',
            await MultipartFile.fromFile(stylePath),
          ),
        )
      : formData.fields.add(
          MapEntry('style_path', stylePath),
        );

  var response = await Dio().postUri(url, data: formData);
  return response;
}
