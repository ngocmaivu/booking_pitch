import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

class TabHistoryBook extends StatefulWidget {
  @override
  _TabHistoryBookState createState() => _TabHistoryBookState();
}

final NumberFormat oCcy = new NumberFormat("#,##0.0", "en_US");

class _TabHistoryBookState extends State<TabHistoryBook> {
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
          title: Text('Các sân đã đặt'),
        ),
        body: SafeArea(
          child: Column(children: [
            _buildMessage(
                200000, '7h-9h', '20/12/2020', 'Sân bóng 5 người Hải Âu'),
            _buildMessage(
                240000, '17h-19h', '15/11/2020', 'Sân bóng 7 người Hải Âu'),
            _buildMessage(
                300000, '13h-15h', '20/12/2020', 'Sân bóng 11 người Hải Âu'),
          ]),
        ),
      ),
    );
  }

  Widget _buildMessage(int price, String time, String date, String pitchName) {
    return Neumorphic(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          depth: 3,
          color: Colors.white,
          // lightSource: LightSource.topLeft,
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Bạn đã đặt sân thành công',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.lightGreen,
                    ),
                    Text(pitchName),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.lightGreen,
                    ),
                    Text('Giá: ' + oCcy.format(price).toString() + ' VND'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors.red,
                    ),
                    Text(date + ' - ' + time),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
