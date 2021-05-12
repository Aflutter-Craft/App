import 'dart:convert';

import 'package:aflutter_craft/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

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

  // get style image path depending on local or not
  var stylePath;
  if (style is! MemoryImage) {
    stylePath = style.url.split('/').skip(4).take(5).join("/");
  }

  // the API URL
  final url = Uri.parse(API_ENDPOINT);

  var formData = FormData.fromMap({
    'alpha': alpha / 100, // scale back alpha value
    'content_img': MultipartFile.fromBytes(
      content.bytes.toList(),
      filename: "content.png",
    ),
  });

  // check if the style is local file
  // in that case add it to request files
  // otherwise pass it as style_path
  style is MemoryImage
      ? formData.files.add(
          MapEntry(
            'style_img',
            MultipartFile.fromBytes(
              style.bytes.toList(),
              filename: "style.png",
            ),
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
          Text("Failed to perform style transfer."),
        ],
      ),
    );
    return;
  }

  // update result provider
  result.setState(
    MemoryImage(
      base64Decode(
        response.data['image'].replaceAll("\n", ""),
      ),
    ),
  );
}

// shows a tooltip with some instructions on it when called
showTooltip(context, tooltips) async {
  WidgetsBinding.instance!.addPostFrameCallback(
    (_) => ShowCaseWidget.of(context)!.startShowCase(
      tooltips,
    ),
  );
}
