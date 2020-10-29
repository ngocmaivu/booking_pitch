import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporttt/ui/tab_home_screen.dart';
import 'package:sporttt/utils/date_time_picker.dart';

class BookingPitch extends StatefulWidget {
  @override
  _BookingPitch createState() => _BookingPitch();
}

class _BookingPitch extends State<BookingPitch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Đặt sân'),
        ),
        body:
            ListView(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0), children: [
          GestureDetector(
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: _buildContainer(
                          'Sân bóng Tiến Phát',
                          'https://i.imgur.com/tpOU8bp.jpg',
                          '112/3 Lê Văn Việt, Q9',
                          '4.5',
                          '0332756462',
                          100000))))
        ]));
  }

  Widget _buildContainer(String namePitch, String imgURL, String address,
      String rate, String phoneNumber, int price) {
    return Column(children: [
      SizedBox(
        height: 11,
      ),
      Container(
        height: 100,
        // color: Colors.grey,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: Image.network(imgURL).image,
          fit: BoxFit.cover,
        )),
      ),
      SizedBox(
        height: 11,
      ),
      Text(namePitch,
          style: TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
              fontSize: 24)),
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
      _buildRow('Giá: ', price.toString() + ' VND'),
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
      new Table(
        // border: TableBorder.all(),
        children: buildButtons(),
      ),
      SizedBox(
        height: 11,
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              'Ghi chú',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: '',
              ),
            ),
            flex: 3,
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
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
              child: Text(
                'ĐẶT SÂN',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.lightGreen,
              onPressed: () {
                setState(() {
                  Fluttertoast.showToast(
                      msg: "Đặt sân thành công",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pop(context);
                });
              },
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
    bool check = false, choose = true;
    int id = 0;
    int time = 7;

    for (var i = 0; i < 4; i++) {
      // new empty row
      List<Widget> rowChildren = [];

      for (var y = 0; y < 4; y++, id++) {
        // fill row with buttons
        rowChildren.add(_buildButtonTime(time, check, booker, choose));
        time++;
      }
      rows.add(new TableRow(children: rowChildren));
    }

    return rows;
  }

  Widget _buildButtonTime(int time, bool booked, String booker, bool choose) {
    return NeumorphicButton(
      onPressed: () {
        if (booked != true) choose = !choose;
      },
      style: NeumorphicStyle(
          color: booked ? Colors.grey : Colors.white,
          border: NeumorphicBorder(color: Colors.black)),
      padding: EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Text(time.toString() + 'h', style: TextStyle(fontSize: 13)),
      ),
    );
  }
}
