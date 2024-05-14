// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
  bool _chk01 = false;
  bool _chk02 = false;
  int bfw = 1;
  List<String> _memberlist = ['ไม่เป็นสมาชิก', 'เป็นสมาชิก'];
  String _member = 'ไม่เป็นสมาชิก';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Image.asset(
                  'assets/images/camera.jpg',
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (paraValue) {
                        setState(() {
                          _chk01 = paraValue!;
                        });
                      },
                      value: _chk01,
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    Text('ผู้ใหญ่ 299 บาท/คน จำนวน '),
                    IntrinsicWidth(
                      child: TextField(
                        enabled: _chk01,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: '   0   คน'),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (paraValue) {
                        setState(() {
                          _chk02 = paraValue!;
                        });
                      },
                      value: _chk02,
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    Text('เด็ก 69 บาท/คน จำนวน '),
                    IntrinsicWidth(
                      child: TextField(
                        enabled: _chk02,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: '   0   คน'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟต์น้ำดื่ม',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                RadioListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: 1,
                  groupValue: bfw,
                  onChanged: (paraValue) {
                    setState(() {
                      bfw = paraValue!;
                    });
                  },
                  title: Text('รับ 25 บาท/หัว'),
                ),
                RadioListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: 2,
                  groupValue: bfw,
                  onChanged: (paraValue) {
                    setState(() {
                      bfw = paraValue!;
                    });
                  },
                  title: Text('ไม่รับ'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('โค้ก 20 บาท/ขวด จำนวน '),
                          IntrinsicWidth(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              enabled: bfw == 2 ? true : false,
                              decoration:
                                  InputDecoration(hintText: '   0   ขวด'),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('น้ำเปล่า 15 บาท/ขวด '),
                          IntrinsicWidth(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              enabled: bfw == 2 ? true : false,
                              decoration:
                                  InputDecoration(hintText: '   0   ขวด'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _member,
                    onChanged: (paraValue) {
                      setState(() {
                        _member = paraValue!;
                      });
                    },
                    items: _memberlist
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBill1Wave,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            'คำนวณเงิน',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.x,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Text(
                            'ยกเลิก',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
