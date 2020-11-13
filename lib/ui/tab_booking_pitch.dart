import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/bloc/booked_pitch.dart';
import 'package:sporttt/ui/tab_confirm_booked.dart';
import 'package:sporttt/utils/button_time.dart';
import 'package:sporttt/utils/date_time_picker.dart';
import 'package:intl/intl.dart';

class BookingPitch extends StatefulWidget {
  @override
  _BookingPitch createState() => _BookingPitch();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

class _BookingPitch extends State<BookingPitch> {
  int _value = 1;
  int price = 110000;
  List<int> listPrice = [110000, 150000, 170000];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Đặt sân'),
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0), children: [
        GestureDetector(
          child: SafeArea(
            child: SingleChildScrollView(
              child: _buildContainer(
                'Sân bóng Hải Âu',
                'https://i.imgur.com/tpOU8bp.jpg',
                '112/3 Lê Văn Việt, Q9',
                '4.5',
                '0332756462',
                price,
                'Sân 5 người',
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildContainer(String namePitch, String imgURL, String address,
      String rate, String phoneNumber, int price, String type) {
    return Column(children: [
      _info(namePitch, address, rate, phoneNumber),
      Neumorphic(
        padding: EdgeInsets.only(top: 10, left: 8, bottom: 10),
        style: NeumorphicStyle(
          depth: 0,
          color: Colors.white,
          border: NeumorphicBorder(width: 1),
        ),
        child: Column(
          children: [
            _buildTypeOfPitch(),
            _buildRow('Giá: ', oCcy.format(price).toString() + ' VND/h'),
            _pickDate(),
            chooseTime(),
            _note(),
            _buttonBook(),
          ],
        ),
      ),
    ]);
  }

  Widget _body(String namePitch, String imgURL, String address, String rate,
      String phoneNumber, int price, String type) {
    return Container();
  }

  Widget _info(
      String namePitch, String address, String rate, String phoneNumber) {
    return Neumorphic(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 5),
      // margin: EdgeInsets.all(15),
      style: NeumorphicStyle(
        depth: 0,
        color: Colors.white,
        border: NeumorphicBorder(width: 1),
      ),
      child: Column(
        children: [
          NeumorphicText(
            namePitch,
            textStyle: NeumorphicTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            style: NeumorphicStyle(
              depth: 0,
              color: Colors.black,
            ),
          ),
          _buildRow('Địa chỉ ', address),
          _rate(rate),
          _buildRow('Liên hệ', phoneNumber),
        ],
      ),
    );
  }

  Widget chooseTime() {
    return Column(
      children: [
        Text('Chọn giờ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
        Container(
          padding: EdgeInsets.all(5),
          child: new Table(
            children: buildButtons(),
          ),
        ),
      ],
    );
  }

  Widget _buttonBook() {
    return Neumorphic(
      margin: EdgeInsets.only(top: 10),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 3,
        // color: Colors.green[200],
        // lightSource: LightSource.topLeft,
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.green[500]),
        child: Text(
          'ĐẶT SÂN',
          style: TextStyle(fontSize: 20),
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          if (LIST_BOOKED[0].timeFrom == 0)
            setState(() {
              Fluttertoast.showToast(
                  msg: "Vui lòng chọn giờ",
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          else
            setState(() {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TabConfirm(),
                  ));
            });
        },
      ),
    );
  }

  Widget _pickDate() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Chọn ngày',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 32),
              child: DatePickerDemo(),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  Widget _note() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.greenAccent,
              ),
              Text("Đang chọn")
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.red,
              ),
              Text("Hết sân")
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.yellow[100],
              ),
              Text("Giờ còn trống")
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _rate(String rate) {
    return Row(children: [
      Expanded(
        child: Text(
          'Đánh giá     ',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        flex: 2,
      ),
      Expanded(
        child: Row(
          children: [
            Text(
              rate,
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
          ],
        ),
        flex: 4,
      ),
    ]);
  }

  Widget _buildTypeOfPitch() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Loại sân",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            flex: 2,
          ),
          Expanded(
            child: Neumorphic(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(
                right: 32,
              ),
              style: NeumorphicStyle(
                depth: 20,
                border: NeumorphicBorder(width: 1),
              ),
              child: DropdownButtonFormField(
                autofocus: true,
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Sân 5 người",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Sân 7 người",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Sân 11 người",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: 3,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    price = listPrice[_value - 1];
                    LIST_BOOKED[0].price = price;
                    if (_value == 1) LIST_BOOKED[0].type = 5;
                    if (_value == 2) LIST_BOOKED[0].type = 7;
                    if (_value == 3) LIST_BOOKED[0].type = 11;
                  });
                },
              ),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String contain) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          child: Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19)),
          flex: 2,
        ),
        Expanded(
          child: Text(contain,
              style: TextStyle(color: Colors.black, fontSize: 19)),
          flex: 4,
        ),
      ]),
    );
  }

  int countTime = 0;
  List<TableRow> buildButtons() {
    List<TableRow> rows = [];
    String booker = 'Nguyen Van A';
    bool check = false, choose = false;
    List<bool> booked = [
      false,
      true,
      true,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    // int tmp = 0;
    int id = 0;
    int time = 7;
    String temp = '';
    for (var i = 0; i < 4; i++) {
      // new empty row
      List<Widget> rowChildren = [];
      for (var y = 0; y < 4; y++, id++) {
        // fill row with buttons
        rowChildren.add(
          TimeButton(
            booked: booked[time - 7],
            time: time,
          ),
        );
        time++;
      }
      rows.add(new TableRow(children: rowChildren));
    }
    return rows;
  }

  Widget _buildButtonTime(int time, bool booked, String booker, bool choose) {
    return NeumorphicButton(
      onPressed: () {
        setState(() {
          choose = !choose;
        });
      },
      style: NeumorphicStyle(
        // color: choose ? Colors.grey[300] : Colors.white,
        // color: Colors.green,
        border: NeumorphicBorder(color: Colors.black, width: 2),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: choose ? Colors.grey[300] : Colors.red,
        child: Text(
          time.toString() + 'h',
          style: TextStyle(
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
