import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sporttt/bloc/booked_pitch.dart';
import 'package:sporttt/ui/tab_booking_pitch.dart';
import 'package:sporttt/ui/tab_home_screen.dart';
import 'package:sporttt/utils/button_time.dart';

class TabConfirm extends StatefulWidget {
  @override
  _TabConfirm createState() => _TabConfirm();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

class _TabConfirm extends State<TabConfirm> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text('Hóa đơn'),
        ),
        body: SafeArea(
          child: ListView(children: [
            Center(
              child: _buildMessage(
                  LIST_BOOKED[0].price,
                  ' 13h',
                  ' 15h',
                  ' 20/11/2020',
                  ' Sân bóng Hải Âu',
                  LIST_BOOKED[0].type.toString(),
                  ' 112/3 Lê Văn Việt, Q9',
                  ' 0332756462',
                  300000),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildMessage(
      int price,
      String timeFrom,
      String timeTo,
      String date,
      String pitchName,
      String typePitch,
      String address,
      String phoneNumber,
      int total) {
    return Neumorphic(
        style: NeumorphicStyle(
          border: NeumorphicBorder(width: 1),
          depth: 0,
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              pitchName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 24,
                ),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_callback,
                ),
                Text(
                  phoneNumber,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                ),
                Text(
                  ' Đơn giá: ' + oCcy.format(price).toString() + ' VND',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.assistant_photo_rounded,
                ),
                Text(
                  ' Loại sân: ' + 'Sân ' + typePitch + ' người',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                ),
                Text(
                  ' Thời gian: ' + 'Thứ sáu - 13/11/2020s',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: Colors.black,
                ),
                Text(
                  ' Giờ nhận sân: ' +
                      LIST_BOOKED[0].timeFrom.toString() +
                      'h  ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.black,
                ),
                Text(
                  '  ' +
                      'Giờ trả sân: ' +
                      LIST_BOOKED[0].timeTo.toString() +
                      'h',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Thành tiền: " +
                  oCcy
                      .format(price *
                          (LIST_BOOKED[0].timeTo - LIST_BOOKED[0].timeFrom))
                      .toString() +
                  ' VND',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _selectPayment(),
            _button(),
          ],
        ));
  }

  bool check = false, check1 = false;
  Widget _selectPayment() {
    return Column(
      children: [
        Text(
          'Phương thức thanh toán',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // color: Colors.
          ),
        ),
        Row(
          children: [
            Checkbox(
              autofocus: true,
              activeColor: Colors.green,
              value: check,
              onChanged: (value) {
                setState(() {
                  if (check1 == true) {
                    check = true;
                    check1 = false;
                  } else
                    check = true;
                });
              },
            ),
            Text("Thanh toán khi tới sân"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              autofocus: true,
              activeColor: Colors.green,
              value: check1,
              onChanged: (value) {
                setState(() {
                  if (check == true) {
                    check1 = true;
                    check = false;
                  } else
                    check1 = true;
                });
              },
            ),
            Text("Thanh toán qua Visa"),
          ],
        ),
      ],
    );
  }

  Widget _button() {
    return Row(
      children: [
        Expanded(
          child: Neumorphic(),
          flex: 1,
        ),
        Expanded(
          child: _buildCancelButton(),
          flex: 4,
        ),
        Expanded(
          child: Neumorphic(),
          flex: 1,
        ),
        Expanded(
          child: _buildConfirmButton(),
          flex: 4,
        ),
        Expanded(
          child: Neumorphic(),
          flex: 1,
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 3,
        color: Colors.green[700],
        // lightSource: LightSource.topLeft,
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.green[700]),
        child: Text(
          'XÁC NHẬN',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            LIST_BOOKED[0].count = 0;
            LIST_BOOKED[0].timeFrom = 0;
            LIST_BOOKED[0].timeTo = 0;
            Fluttertoast.showToast(
                msg: "Xác nhận đặt sân thành công",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => TabHomeScreen(),
                ));
          });
        },
      ),
    );
  }

  Widget _buildCancelButton() {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
        depth: 3,
        color: Colors.green[200],
        // lightSource: LightSource.topLeft,
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.redAccent),
        child: Text(
          'HỦY ĐẶT',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            // LIST_BOOKED[0].count = 0;
            // LIST_BOOKED[0].timeFrom = 0;
            // LIST_BOOKED[0].timeTo = 0;
            // Fluttertoast.showToast(
            //     msg: "Hủy đặt sân thành công",
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.green,
            //     textColor: Colors.white,
            //     fontSize: 16.0);
            Navigator.pop(
                context,
                CupertinoPageRoute(
                  builder: (context) => BookingPitch(),
                ));
          });
        },
      ),
    );
  }

  List<TableRow> buildButtons() {
    List<TableRow> rows = [];
    String booker = 'Nguyen Van A';
    bool check = false, choose = false;
    List<String> service = [
      'Cho thuê trang phục cầu thủ - 15 000 VND/bộ',
      'Bán trang phục cầu thủ - 85 000 VND/bộ',
      'Thuê banh - 20 000 VND/trái/h',
      '...',
      '...',
    ];
    int tmp = 0;
    int id = 0;

    for (var i = 0; i < 5; i++) {
      // new empty row
      List<Widget> rowChildren = [];
      for (var y = 0; y < 1; y++, id++) {
        // fill row with buttons
        rowChildren.add(
          TimeButton(
            time: 0,
            booked: false,
            // service: service[tmp],
          ),
        );
      }
      tmp++;
      rows.add(new TableRow(children: rowChildren));
    }
    return rows;
  }
}
