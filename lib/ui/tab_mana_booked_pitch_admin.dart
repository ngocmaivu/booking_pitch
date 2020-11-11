import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/ui/tab_owner.dart';

class BookingPitchManagement extends StatefulWidget {
  @override
  _BookingPitchManagement createState() => _BookingPitchManagement();
}

class _BookingPitchManagement extends State<BookingPitchManagement> {
  String value;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Quản lí đặt sân'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildListPitch('https://i.imgur.com/tpOU8bp.jpg',
                'Sân bóng 5 người Hải Âu', 'Quận 9'),
            SizedBox(
              height: 10,
            ),
            new Table(
              // border: TableBorder.all(),
              children: buildButtons(),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 180,
                ),
                Text('* Khung giờ đã được đặt - chọn '),
                Icon(
                  Icons.circle,
                  color: Colors.grey,
                ),
              ],
            ),
            Text('Nhấn vào để xem chi tiết '),
            SizedBox(
              height: 20,
            ),
            deletePitch(),
          ],
        ),
      ),
    );
  }

  List<TableRow> buildButtons() {
    List<TableRow> rows = [];
    String booker = 'Nguyen Van A';
    bool check = false;
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
              Text('Giờ nhận sân: 13h'),
              Text('Giờ trả sân: 15h'),
              Text('Tổng tiền: 300 000 VND')
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Từ chối'),
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
    return NeumorphicButton(
      // color: Colors.white,
      style: NeumorphicStyle(
          depth: 0,
          color: booked ? Colors.grey : Colors.white,
          border: NeumorphicBorder(color: Colors.black)),
      onPressed: () {
        if (booked == true) _showBookerInfor(booker, time - 7);
      },
      padding: EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(10.0),
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

  Widget _buildListPitch(String imgURL, String pitchName, String address) {
    return Row(
      children: [
        Expanded(
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
          flex: 7,
        ),
      ],
    );
  }

  Widget deletePitch() {
    return Neumorphic(
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
          'XÓA SÂN',
          style: TextStyle(fontSize: 20),
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            Fluttertoast.showToast(
                msg: "Xóa sân thành công",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => PitchManagement(),
              ),
            );
          });
        },
      ),
    );
  }
}
