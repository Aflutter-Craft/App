import 'dart:math';

import 'package:flutter/services.dart';

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
