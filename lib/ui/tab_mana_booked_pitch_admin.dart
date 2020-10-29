import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/ui/tab_creat_pitch.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Quản lí đặt sân'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildListPitch(
                'https://i.imgur.com/tpOU8bp.jpg', 'Sân bóng ABC', 'Quận 9'),
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
    int id = 0;
    int time = 7;

    for (var i = 0; i < 4; i++) {
      // new empty row
      List<Widget> rowChildren = [];

      for (var y = 0; y < 4; y++, id++) {
        // fill row with buttons
        rowChildren.add(_buildButtonTime(time, check, booker));
        time++;
      }
      rows.add(new TableRow(children: rowChildren));
    }

    return rows;
  }

  _showBookerInfor(String booker) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Sân đã được đặt'),
          content: Text('Người đặt: ' + booker),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Hủy đặt'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Cho phép'),
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
          color: booked ? Colors.grey : Colors.white,
          border: NeumorphicBorder(color: Colors.black)),
      onPressed: () {
        if (booked == true) _showBookerInfor(booker);
      },
      padding: EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Text(time.toString() + 'h', style: TextStyle(fontSize: 13)),
      ),
    );
  }

  Widget _buildListPitch(String imgURL, String pitchName, String address) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 75,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: Image.network(imgURL).image,
              // fit: BoxFit.cover,
            )),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pitchName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                address,
                style: TextStyle(
                  fontSize: 13,
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
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            child: Text(''),
            color: Colors.white,
            onPressed: () {},
          ),
          flex: 1,
        ),
        Expanded(
          child: FlatButton(
            child: Text('XÓA SÂN'),
            color: Colors.lightGreen,
            onPressed: () {},
          ),
          flex: 3,
        ),
        Expanded(
          child: FlatButton(
            child: Text(''),
            color: Colors.white,
            onPressed: () {},
          ),
          flex: 1,
        ),
      ],
    );
  }
}
