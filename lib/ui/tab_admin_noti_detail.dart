import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNotificationAdmin extends StatefulWidget {
  @override
  _TabNotificationAdmin createState() => _TabNotificationAdmin();
}

class _TabNotificationAdmin extends State<TabNotificationAdmin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Thông báo'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildMessage(
                      bookerName: 'Nguyen Van A',
                      pitchName: 'San ABC',
                      time: 'Thứ Ba, 14:45'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showNotiDetail(String booker, String pitchName, String time, double price,
      int timeFrom, int timeTo) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Sân đã được đặt'),
          content: Column(
            children: [
              Text('Người đặt: ' + booker),
              Text('Sân: ' + pitchName),
              Text('Giờ nhận sân: ' + timeFrom.toString()),
              Text('Giờ trả sân: ' + timeTo.toString()),
              Text('Tổng tiền: ' + price.toString())
            ],
          ),
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

  Widget _buildMessage({
    String bookerName,
    String pitchName,
    String time,
    int timeFrom,
    int timeTo,
    double price,
  }) {
    return GestureDetector(
        onTap: () => _showNotiDetail(
            bookerName, pitchName, time, price, timeFrom, timeTo),
        child: Container(
          // width: ,
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Có người vừa đặt sân của bạn',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(bookerName + ' vừa đặt sân ' + pitchName),
                    Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                flex: 7,
              ),
            ],
          ),
        ));
  }
}
