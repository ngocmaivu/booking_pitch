import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/bloc/booked_pitch.dart';
import 'package:sporttt/ui/tab_confirm_booked.dart';
import 'package:sporttt/utils/button_time.dart';
import 'package:sporttt/utils/date_time_picker.dart';
import 'package:intl/intl.dart';

class PitchDetail extends StatefulWidget {
  @override
  _PitchDetail createState() => _PitchDetail();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

class _PitchDetail extends State<PitchDetail> {
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
                110000,
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
      Text(
        namePitch,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: Colors.green),
      ),
      Row(
        children: [
          SizedBox(
            width: 200,
          ),
          Icon(
            Icons.circle,
            color: Colors.greenAccent,
          ),
          Text("Giờ đang được chọn")
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: 200,
          ),
          Icon(
            Icons.circle,
            color: Colors.grey,
          ),
          Text("Giờ đã được đặt")
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: 200,
          ),
          Icon(
            Icons.circle,
            color: Colors.white,
          ),
          Text("Giờ còn trống")
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
          depth: 3,
          color: Colors.green[200],
          // lightSource: LightSource.topLeft,
        ),
        child: NeumorphicButton(
          style: NeumorphicStyle(color: Colors.green[200]),
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
      ),
    ]);
  }

  int countTime = 0;
  List<Row> buildButtons() {
    List<Row> rows = [];
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
      rows.add(new Row(children: rowChildren));
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
