import 'dart:io';

import 'package:aflutter_craft/screens/screens.dart';
import 'package:aflutter_craft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_size/window_size.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check if we are on mobile
    bool isMobile = Platform.isAndroid || Platform.isIOS;

    // set desktop window properties
    if (!isMobile) {
      setWindowTitle('Aflutter Craft');
      setWindowMinSize(Size(1280, 720));
      setWindowMaxSize(Size.infinite);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aflutter Craft',
      theme: ThemeData(
        primaryColor: AppColors.backgroundCol,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: isMobile ? MobileHome() : DesktopHome(),
    );
  }
}
