// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, sort_child_properties_last, non_constant_identifier_names, unrelated_type_equality_checks, prefer_is_empty, unused_local_variable

import 'dart:ffi';
import 'dart:io';
import 'package:dti_mukrata_app/views/show_pay_bill_ui%20.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
//CBcheck status
  bool? _adultStatus = false;
  bool? _teenStatus = false;
  bool _waterSelected = true;
//CB and radio Ctrl
  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController teenCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController plainCtrl = TextEditingController(text: '0');
//radio var
  String food = 'Beverage';
//radio check status
  bool? StatusBvr = false;
  String _memberTypeSelected = 'ไม่เป็นสมาชิก';

  List<String> _memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member ลด 10%',
    'สมาชิก Platinum Member ลด 20%',
  ];
  //รูปที่ถ่าย
  File? _imageFromCamera;

//Take Photo Method

  Future _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (image == null) return;
    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

  //สร้างเมธอดแสดง WarningMessage
  showWarningMessage(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
          textAlign: TextAlign.center,
        ),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'คิดเงิน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      */
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.085,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _getImageFromCamera();
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: _imageFromCamera == null
                          ? Image.asset(
                              'assets/images/camera.jpg',
                              width: MediaQuery.of(context).size.width * 0.35,
                            )
                          : Image.file(
                              _imageFromCamera!,
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.35,
                            )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'จำนวนคน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _adultStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          if (paramValue == false) {
                            setState(() {
                              adultCtrl.text = '0';
                            });
                          }
                          _adultStatus = paramValue;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: adultCtrl,
                        enabled: _adultStatus,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'คน',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _teenStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          if (paramValue == false) {
                            setState(() {
                              teenCtrl.text = '0';
                            });
                          }
                          _teenStatus = paramValue;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: teenCtrl,
                        enabled: _teenStatus,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'คน',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  'บุปเฟต์น้ำดื่ม',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.deepOrange,
                      value: true,
                      groupValue: _waterSelected,
                      onChanged: (paramValue) {
                        setState(() {
                          _waterSelected = paramValue!;
                        });
                      },
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.deepOrange,
                      value: false,
                      groupValue: _waterSelected,
                      onChanged: (paramValue) {
                        setState(() {
                          _waterSelected = paramValue!;
                        });
                      },
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      '  โค้ก 20 บาท/ขวด จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: cokeCtrl,
                        enabled: !_waterSelected,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'ขวด',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      '  น้ำเปล่า 15 บาท/ขวด จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: plainCtrl,
                        enabled: !_waterSelected,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'ขวด',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  'ประเภทสมาชิก',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                DropdownButton(
                  value: _memberTypeSelected,
                  isExpanded: true,
                  onChanged: (paramValue) {
                    setState(() {
                      _memberTypeSelected = paramValue!;
                    });
                  },
                  items: _memberType
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_imageFromCamera == null) {
                            showWarningMessage(context, 'ถ่ายรูปด้วย');
                            return;
                          } else if (_adultStatus == false &&
                              _teenStatus == false) {
                            showWarningMessage(
                                context, 'เลือกผู้ใหญ่และหรือเด็กที่มากินด้วย');
                            return;
                          } else if (_adultStatus == true &&
                                  adultCtrl.text == '0' ||
                              adultCtrl.text.trim().length == 0) {
                            showWarningMessage(
                                context, 'ตรวจสอบจำนวนผู้ใหญ่ด้วย');
                            return;
                          } else if (_teenStatus == true &&
                                  teenCtrl.text == '0' ||
                              teenCtrl.text.trim().length == 0) {
                            showWarningMessage(context, 'ตรวจสอบจำนวนเด็กด้วย');
                            return;
                          }
                          double payBill = 0;
                          int adultNum = int.parse(adultCtrl.text);
                          int teenNum = int.parse(teenCtrl.text);
                          int cokeNum = int.parse(cokeCtrl.text);
                          int plainNum = int.parse(plainCtrl.text);
                          int buffetNum = _waterSelected == true
                              ? 25 * (adultNum + teenNum)
                              : 0;

                          payBill = (adultNum * 299) +
                              (teenNum * 69) +
                              (buffetNum) +
                              (cokeNum * 20) +
                              (plainNum * 15);

                          // 'ไม่เป็นสมาชิก',
                          // 'สมาชิก Silver Member ลด 5%',
                          // 'สมาชิก Gold Member ลด 10%',
                          // 'สมาชิก Platinum Member ลด 20%',

                          if (_memberTypeSelected == 'ไม่เป็นสมาชิก') {
                            payBill = payBill;
                          } else if (_memberTypeSelected ==
                              'สมาชิก Silver Member ลด 5%') {
                            payBill = payBill * 0.95;
                          } else if (_memberTypeSelected ==
                              'สมาชิก Gold Member ลด 10%') {
                            payBill = payBill * 0.90;
                          } else {
                            payBill = payBill * 0.80;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowPayBillUI(
                                    imageFromCamera: _imageFromCamera,
                                    adult: adultCtrl.text,
                                    teen: teenCtrl.text,
                                    waterSelected: _waterSelected == true? 'รับ':'ไม่รับ',
                                    coke: cokeCtrl.text,
                                    plain: plainCtrl.text,
                                    memberType: _memberTypeSelected,
                                    payBill: payBill.toString(),
                                    )),
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณเงิน',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _imageFromCamera = null;
                            _adultStatus = false;
                            adultCtrl.text = '0';
                            _teenStatus = false;
                            teenCtrl.text = '0';
                            _waterSelected = true;
                            cokeCtrl.text = '0';
                            plainCtrl.text = '0';
                            _memberTypeSelected = 'ไม่เป็นสมาชิก';
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
