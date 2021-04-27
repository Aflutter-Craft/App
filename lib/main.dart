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
    if (isMobile) {
      // set status bar and navigation bar colors
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: AppColors.accentColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.backgroundCol,
          systemNavigationBarDividerColor: AppColors.backgroundCol,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      // set desktop window properties
      setWindowTitle('Aflutter Craft');
      setWindowMinSize(Size(1280, 720));
      setWindowMaxSize(Size.infinite);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
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
