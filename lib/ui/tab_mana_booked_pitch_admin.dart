import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sporttt/ui/tab_owner.dart';
import 'package:sporttt/ui/tab_update_pitch.dart';

class BookingPitchManagement extends StatefulWidget {
  @override
  _BookingPitchManagement createState() => _BookingPitchManagement();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");
int price = 110000;

class _BookingPitchManagement extends State<BookingPitchManagement> {
  String value;
  int index, _value = 1;
  List<bool> checked = [
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
    false,
  ];

  List<int> listPrice = [110000, 150000, 170000];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Quản lí đặt sân'),
      ),
      body: Container(
        height: 620,
        child: Neumorphic(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          style: NeumorphicStyle(
              depth: 0,
              color: Colors.white,
              border: NeumorphicBorder(width: 1)),
          child: Column(
            children: <Widget>[
              _buildListPitch('https://i.imgur.com/tpOU8bp.jpg',
                  'Sân bóng Hải Âu', '23/4 Lã Xuân Oai - LT - Quận 9'),
              _buildTypeOfPitch(),
              _buildRow('Giá: ', oCcy.format(price).toString() + ' VND/h'),
              new Table(
                children: buildButtons(),
              ),
              Row(
                children: [
                  Text('*Khung giờ đã được đặt'),
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                ],
              ),
              Text('Nhấn vào để xem chi tiết '),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: updatePitch(),
                    flex: 1,
                  ),
                  Expanded(
                    child: deletePitch(),
                    flex: 1,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String contain) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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

  List<TableRow> buildButtons() {
    List<TableRow> rows = [];
    String booker = 'Nguyen Van A';
    bool check = false;

    int id = 0;
    int time = 7;

    for (var i = 0; i < 4; i++) {
      // new empty row
      List<Widget> rowChildren = [];

      for (var y = 0; y < 4; y++, id++) {
        // fill row with buttons
        rowChildren.add(_buildButtonTime(time, checked[time - 7], booker));
        time++;
      }
      rows.add(new TableRow(children: rowChildren));
    }

    return rows;
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
                intensity: 1,
                border: NeumorphicBorder(width: 1),
              ),
              child: DropdownButtonFormField(
                autofocus: true,
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Sân 5 người",
                      style: TextStyle(fontSize: 16),
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

  _showBookerInfor(String booker, int id) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Sân đã được đặt'),
          content: Column(
            children: [
              Text('Người đặt: ' + booker),
              Text('Sân bóng 5 người Hải Âu '),
              Text('Thanh toán bằng tiền mặt'),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Từ chối'),
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return CupertinoAlertDialog(
                //         title: Text('Nhập lý do'),
                //         content: Container(
                //           height: 250,
                //           width: 250,
                //           child: TextFormField(),
                //         ),
                //         actions: [
                //           CupertinoDialogAction(child: Text('Xác nhận'))
                //         ],
                //       );
                //     });
                Navigator.of(context).pop();
                setState(() {
                  checked[id] = false;
                });
              },
            ),
            CupertinoDialogAction(
              child: Text('Chấp nhận'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtonTime(int time, bool booked, String booker) {
    Color color = booked ? Colors.red : Colors.white;
    return Container(
      margin: EdgeInsets.all(5),
      child: NeumorphicButton(
        onPressed: () {
          setState(() {
            if (booked == true) {
              _showBookerInfor(booker, time - 7);
            }
          });
        },
        style: NeumorphicStyle(
            depth: 0, color: color, border: NeumorphicBorder(width: 1)),
        padding: EdgeInsets.all(12),
        child: Container(
          // padding: EdgeInsets.all(10.0),
          child: Text(
            time.toString() + 'h' + '-' + (time + 1).toString() + 'h',
            style: TextStyle(
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildListPitch(String imgURL, String pitchName, String address) {
    return Neumorphic(
      margin: EdgeInsets.only(bottom: 20),
      style: NeumorphicStyle(depth: 0, color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pitchName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            address,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget deletePitch() {
    return NeumorphicButton(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      style: NeumorphicStyle(
        color: Colors.green,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
      ),
      child: Text(
        'XÓA SÂN',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      // color: Colors.lightGreen,
      onPressed: () {
        setState(() {
          if (checked.contains(true)) {
            Fluttertoast.showToast(
                msg: "Sân đang có người đặt",
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            Fluttertoast.showToast(
                msg: "Yêu cầu xóa sân đang chờ duyệt",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pop(
              context,
              CupertinoPageRoute(
                builder: (context) => PitchManagement(),
              ),
            );
          }
        });
      },
    );
  }

  Widget updatePitch() {
    return NeumorphicButton(
      margin: EdgeInsets.symmetric(horizontal: 16),
      style: NeumorphicStyle(
        color: Colors.green,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
      ),
      child: Text(
        'CHỈNH SỬA',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      // color: Colors.lightGreen,
      onPressed: () {
        setState(() {
          if (checked.contains(true)) {
            Fluttertoast.showToast(
                msg: "Sân đang có người đặt",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => TabUpdatePitch(),
              ),
            );
          }
        });
      },
    );
  }
}
