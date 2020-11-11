import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sporttt/ui/tab_home_screen.dart';
import 'package:sporttt/utils/button_time.dart';

class TabConfirm extends StatefulWidget {
  @override
  _TabConfirm createState() => _TabConfirm();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

class _TabConfirm extends State<TabConfirm> {
  @override
  void initState() {
    super.initState();
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
            _buildMessage(
                100000,
                ' 13h',
                ' 15h',
                ' 20/11/2020',
                ' Sân bóng Hải Âu',
                ' Sân 5 người',
                ' 112/3 Lê Văn Việt, Q9',
                ' 0332756462',
                300000),
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
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                  Icons.access_time_rounded,
                  color: Colors.black,
                ),
                Text(
                  ' Giờ nhận sân: ' + timeFrom + '  ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.all_inclusive_outlined,
                  color: Colors.black,
                ),
                Text(
                  '  ' + 'Giờ trả sân: ' + timeTo,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Dịch vụ kèm theo",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // new Table(
            //   children: buildButtons(),
            // ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Thành tiền: " + oCcy.format(total).toString() + ' VND',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
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
            ),
          ],
        ));
  }

  Widget _buildConfirmButton() {
    return Neumorphic(
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
          'XÁC NHẬN',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        // color: Colors.lightGreen,
        onPressed: () {
          setState(() {
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
            Fluttertoast.showToast(
                msg: "Hủy đặt sân thành công",
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
