import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/ui/tab_history_book.dart';
import 'package:sporttt/utils/button_time.dart';
import 'package:sporttt/utils/date_time_picker.dart';
import 'package:intl/intl.dart';

class BookingPitch extends StatefulWidget {
  @override
  _BookingPitch createState() => _BookingPitch();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

class _BookingPitch extends State<BookingPitch> {
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
                  100000),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildContainer(String namePitch, String imgURL, String address,
      String rate, String phoneNumber, int price) {
    return Column(children: [
      SizedBox(
        height: 11,
      ),
      // Container(
      //   height: 100,
      //   // color: Colors.grey,
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //     image: Image.network(imgURL).image,
      //     fit: BoxFit.cover,
      //   )),
      // ),
      // SizedBox(
      //   height: 11,
      // ),
      NeumorphicText(
        namePitch,
        textStyle: NeumorphicTextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        style: NeumorphicStyle(
          depth: 10,
          color: Colors.green,
        ),
      ),
      SizedBox(
        height: 11,
      ),
      _buildRow('Địa chỉ: ', address),
      Row(children: [
        Text('Đánh giá:       ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
        Text(
          rate,
          style: TextStyle(color: Colors.black, fontSize: 19),
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ]),
      SizedBox(
        height: 5,
      ),
      _buildRow('SĐT :', phoneNumber),
      SizedBox(
        height: 5,
      ),
      _buildRow('Giá: ', oCcy.format(price).toString() + ' VND'),
      Row(
        children: [
          Text('Chọn ngày    ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19)),
          DatePickerDemo(),
        ],
      ),
      Text('Chọn giờ:',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      SizedBox(
        height: 11,
      ),
      // new Table(
      //   // border: TableBorder.all(),
      //   children: buildButtons(),
      // ),
      new Table(
        children: buildButtons(),
      ),
      SizedBox(
        height: 30,
      ),

      Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
          depth: 8,
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
            setState(() {
              Fluttertoast.showToast(
                  msg: "Đặt sân thành công",
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TabHistoryBook(),
                  ));
            });
          },
        ),
      ),
    ]);
  }

  Widget _buildRow(String title, String contain) {
    return Row(children: [
      Expanded(
        child: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
        flex: 2,
      ),
      Expanded(
        child:
            Text(contain, style: TextStyle(color: Colors.black, fontSize: 19)),
        flex: 5,
      ),
    ]);
  }

  List<TableRow> buildButtons() {
    List<TableRow> rows = [];
    String booker = 'Nguyen Van A';
    bool check = false, choose = false;
    int id = 0;
    int time = 7;

    for (var i = 0; i < 4; i++) {
      // new empty row
      List<Widget> rowChildren = [];

      for (var y = 0; y < 4; y++, id++) {
        // fill row with buttons
        rowChildren.add(TimeButton(
          booked: check,
          time: time,
        ));
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
