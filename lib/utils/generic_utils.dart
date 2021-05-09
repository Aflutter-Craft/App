import 'dart:convert';

import 'package:aflutter_craft/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// shows a snackbar with passed text
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

  // get api response
  var response;
  try {
    response = await Dio().postUri(url, data: formData);
  } on DioError {
    response = null;
  }
  return response;
}

// used to do style transfer and save results
// while updating the results provider along the way
performTransfer(watch) async {
  final cache = watch(cacheProvider);
  final result = watch(resultProvider.notifier);

  result.setState(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(),
        SizedBox(height: 20),
        Text("Applying Style..."),
      ],
    ),
  );

  // get the stylized image from API
  final response = await styleTransfer(watch);

  // if response is null then update the result and return
  if (response == null) {
    result.setState(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline),
          SizedBox(height: 20),
          Text("Faild to perform style transfer"),
        ],
      ),
    );
    return;
  }
  // save it to cache (use endpoint as key)
  cache.putFile(
    API_ENDPOINT,
    base64Decode(
      response.data['image'].replaceAll("\n", ""),
    ),
    fileExtension: "jpg",
  );

  // get it as a file from cache
  final file = await cache.getSingleFile(API_ENDPOINT);

  // update result provider
  result.setState(FileImage(file));
}
