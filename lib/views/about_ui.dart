// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'แอปพลิเคชันร้านหมูกระทะ',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              'เพื่อคนไทย',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              'โดยเด็กไทย',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              'สนใจแอปพลิเคชั่นติดต่อ',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Image.asset(
              'assets/images/sauqr.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
