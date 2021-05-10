import 'dart:math';

import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showcaseview/showcaseview.dart';

//  generate random index image to be shown as cover for style category
// this is done once per app run
Random random = new Random();
int randomNumber = random.nextInt(99) + 1; // from 1 upto 99 included

/* 
  Fetching the style images:
  host: AWS S3
  number of files: way too many
  size: total = 35GB
  proposed solution:
  - make the style images public (allowing fetching from anywhere with an API call)
  - with aws cli write a script:
      - get name of files in each style category
      - take random 100 image file names and save them to a file
      - these 100 random image names will be the styles shown in the app
  - save files to project assets as txt

  How to use:
  - fetch raw category.txt from assets
  - fetch image by name from public aws s3 bucket

  advantages:
  - works on all platforms
  - no need for using AWS secrets and thus more secure
  - no need for extra libraries (sort of)   
  - cached images across app sessions
*/
// load file with list of image names for each category
getImagesList({category}) async {
  // get category file from assets
  var file = await rootBundle.loadString("assets/texts/$category.txt");

  // append category to beggining of file name
  var filesList =
      file.split("\n").map((line) => category + "/" + line).toList();

  return filesList;
}

// check if the current style and content images are the default ones
// used to enable the style transfer button
bool checkDefault(content, style) {
  return content.toString().contains("default") ||
      style.toString().contains("default");
}

// shows a tooltip with some instructions on it when called
// only used for images so it belongs in this file
showTooltip(context, tooltips) async {
  WidgetsBinding.instance!.addPostFrameCallback(
    (_) => ShowCaseWidget.of(context)!.startShowCase(
      tooltips,
    ),
  );
}

// show image in full screen
showImage({image, context}) async {
  await showDialog(
    barrierDismissible: true,
    barrierColor: Colors.black54,
    context: context,
    builder: (context) => ImageDetailScreen(image: image),
  );
}

// pick mobile image from camera or gallery
pickMobileImage(context) async {
  var file;
  final imageSource = await showModalBottomSheet<ImageSource>(
    context: context,
    backgroundColor: AppColors.backgroundCol,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => Container(
      padding: EdgeInsets.all(30),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            child: Column(
              children: [
                Icon(
                  Icons.add_a_photo_outlined,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text("Take a Picture"),
              ],
            ),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
          MaterialButton(
            child: Column(
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text("Pick from Gallery"),
              ],
            ),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          )
        ],
      ),
    ),
  );
  if (imageSource != null) {
    file = await ImagePicker().getImage(
      source: imageSource,
    );
  }
  return file;
}
