// i do not know what to name this file

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

import 'dart:math';
import 'package:flutter/services.dart';

//  generate random index image to be shown as cover for style
// this is done once per app run
Random random = new Random();
int randomNumber = random.nextInt(99) + 1; // from 10 upto 99 included

const String BUCKET_PREFIX = "https://aflutter-craft.s3.amazonaws.com/styles/";

// convert each word of text to capital
String convertToTitleCase(String text) {
  if (text.length <= 1) {
    return text.toUpperCase();
  }

  // Split string into multiple words
  final List<String> words = text.split(' ');

  // Capitalize first letter of each words
  final capitalizedWords = words.map((word) {
    if (word.trim().isNotEmpty) {
      final String firstLetter = word.trim().substring(0, 1).toUpperCase();
      final String remainingLetters = word.trim().substring(1);

      return '$firstLetter$remainingLetters';
    }
    return '';
  });

  // Join/Merge all words back to one String
  return capitalizedWords.join(' ');
}

// hook function as string extention
extension CapitalizedStringExtension on String {
  String toTitleCase() {
    return convertToTitleCase(this);
  }
}

// load file with list of image names for each category
getImagesList({category}) async {
  // get category file from assets
  var file = await rootBundle.loadString("assets/texts/$category.txt");

  // append category to beggining of file name
  var filesList =
      file.split("\n").map((line) => category + "/" + line).toList();

  return filesList;
}
