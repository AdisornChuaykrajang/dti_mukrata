// ignore_for_file: prefer_const_constructors

import 'package:dti_mukrata_app/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MainUI()
  );
}

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
          textTheme: GoogleFonts.kanitTextTheme(
        Theme.of(context).textTheme,
      )),
    );
  }
}
