import 'package:aflutter_craft/screens/screens.dart';
import 'package:aflutter_craft/utils/theme.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_size/window_size.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // set desktop window properties
    if (!isMobile) {
      setWindowTitle('Aflutter Craft');
      setWindowMinSize(Size(1280, 720));
      setWindowMaxSize(Size.infinite);
    } else {
      // set status bar and navigation bar colors
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.backgroundCol,
          statusBarColor: AppColors.accentColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: AppColors.backgroundCol,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
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
