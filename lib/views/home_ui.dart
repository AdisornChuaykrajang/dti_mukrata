// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dti_mukrata_app/views/about_ui.dart';
import 'package:dti_mukrata_app/views/calculate_pay_bill_ui.dart';
import 'package:dti_mukrata_app/views/menu_shop_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  List<Widget> _showView = [
    CalculatePayBillUI(),
    MenuShopUI(),
    AboutUI(),
  ];

  int _currentIndex = 1;

  final _controller = NotchBottomBarController(index: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Tech SAU BUFFET',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: _showView[_currentIndex],
        bottomNavigationBar: AnimatedNotchBottomBar(
            notchBottomBarController: _controller,
            color: Colors.deepOrange,
            notchColor: Colors.deepOrange,
            bottomBarItems: const [
              BottomBarItem(
                inActiveItem: Icon(
                  FontAwesomeIcons.moneyBill1Wave,
                  color: Colors.grey,
                ),
                activeItem: Icon(
                  FontAwesomeIcons.moneyBill1Wave,
                  color: Colors.white,
                ),
                itemLabel: 'คิดเงิน',
              ),
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeItem: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                itemLabel: 'Home',
              ),
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                activeItem: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                itemLabel: 'เกี่ยวกับ',
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            kIconSize: 24,
            kBottomRadius: 30));
  }
}
