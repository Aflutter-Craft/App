import 'dart:io';

import 'package:aflutter_craft/screens/screens.dart';
import 'package:aflutter_craft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check if we are on mobile
    bool isMobile;
    try {
      isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (e) {
      isMobile = false;
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
