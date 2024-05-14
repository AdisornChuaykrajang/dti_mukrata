// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuShopUI extends StatefulWidget {
  const MenuShopUI({super.key});

  @override
  State<MenuShopUI> createState() => _MenuShopUIState();
}

class _MenuShopUIState extends State<MenuShopUI> {
  List<String> _menu = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  List<String> _shop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            'เมนูเด็ด',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _menu.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      _menu[index],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            'ร้านในเครือ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _shop.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      _shop[index],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      )),
    );
  }
}
